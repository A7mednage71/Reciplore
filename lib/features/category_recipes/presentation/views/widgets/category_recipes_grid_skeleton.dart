import 'package:flutter/widgets.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryRecipesGridSkeleton extends StatelessWidget {
  const CategoryRecipesGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = List.generate(
      6,
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
      child: CategoryRecipesGridView(recipes: recipes),
    );
  }
}
