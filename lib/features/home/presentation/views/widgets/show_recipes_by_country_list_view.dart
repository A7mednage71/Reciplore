import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
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
    final cubit = context.read<GetRecipesByCountryCubit>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !cubit.isFetching &&
        cubit.hasNextPage) {
      cubit.getRecipesByCountry(countryId: cubit.selectedCountryId);
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
      child: BlocBuilder<GetRecipesByCountryCubit, GetRecipesByCountryState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            failure: (message) => FailureState(hight: 50.h, message: message),
            loading: () {
              return const ShowRecipesByCountryLoading();
            },
            success: (recipes) {
              if (recipes.isEmpty) {
                return const Center(child: EmptyState());
              }
              return ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.only(left: 30.w),
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pushNamed(
                            Routes.showRecipeDetails,
                            arguments: recipes[index]);
                      },
                      child: RecipeItem(
                        recipeModel: recipes[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
