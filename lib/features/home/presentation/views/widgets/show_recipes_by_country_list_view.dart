import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';

class ShowRecipesByCountryListView extends StatefulWidget {
  const ShowRecipesByCountryListView({
    super.key,
    required this.recipes,
  });

  final List<RecipeModel> recipes;

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
            _scrollController.position.maxScrollExtent - 300 &&
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
    final cubit = context.read<GetRecipesByCountryCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(left: 30.w),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: widget.recipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                        Routes.showRecipeDetails,
                        arguments: widget.recipes[index]);
                  },
                  child: RecipeItem(
                    recipeModel: widget.recipes[index],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(
            '${widget.recipes.length} /${cubit.totalRecipesLength} Recipes',
            style: AppStyles.extraSmallRegularText
                .copyWith(color: AppColors.grayLight),
          ),
        )
      ],
    );
  }
}
