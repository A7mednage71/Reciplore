import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchGridViewSkeleton extends StatelessWidget {
  const SearchGridViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = List.generate(
      10,
      (index) => RecipeModel(
        id: '',
        name: 'Recipe Recipe name',
        description: '',
        images: RecipeImages(
            urls: [ImageURL(secureUrl: AppConstants.defaultRecipeItemImage)]),
        averageRating: 0,
        category: RecipeCategoryModel(id: '', name: 'Category name'),
        country: RecipeCountryModel(id: '', name: 'Country name'),
        createdBy: CreatedByModel(
            username: '',
            profileImage:
                ImageURL(secureUrl: AppConstants.defaultRecipeItemImage)),
        directions: '',
        isFavourite: false,
        videoLink: '',
        tags: [],
        views: 0,
        ingredients: [],
      ),
    );

    return Skeletonizer(
      containersColor: AppColors.white,
      child: GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return SearchRecipeItem(recipeModel: recipes[index]);
        },
      ),
    );
  }
}
