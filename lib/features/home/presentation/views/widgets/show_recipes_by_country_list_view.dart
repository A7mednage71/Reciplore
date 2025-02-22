import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_recipes_by_country_loading.dart';

class ShowRecipesByCountryListView extends StatefulWidget {
  const ShowRecipesByCountryListView({
    super.key,
  });

  @override
  State<ShowRecipesByCountryListView> createState() =>
      _ShowRecipesByCountryListViewState();
}

class _ShowRecipesByCountryListViewState
    extends State<ShowRecipesByCountryListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<GetRecipesCubit>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !cubit.isFetching &&
        cubit.hasNextPage) {
      cubit.getRecipes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<GetRecipesCubit, GetRecipesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            failure: (message) => FailureState(hight: 50.h, message: message),
            loading: () {
              return const ShowRecipesByCountryLoading();
            },
            success: (recipes) {
              final cubit = context.read<GetRecipesCubit>();
              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(left: 30.w),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length + 1,
                itemBuilder: (context, index) {
                  if (index < recipes.length) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(Routes.showRecipeDetails);
                        },
                        child: RecipeItem(
                          recipeModel: recipes[index],
                        ),
                      ),
                    );
                  } else if (cubit.hasNextPage) {
                    return const ShowRecipesByCountryLoading();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
