import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipe_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SavedRecipesLoading extends StatelessWidget {
  const SavedRecipesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = List.generate(
      4,
      (index) => RecipeModel(
        id: '',
        name: 'Recipe name',
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
    return Expanded(
      child: Skeletonizer(
        ignoreContainers: false,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.h),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 0 : 15.h),
              child:
                  SavedRecipeItem(recipeModel: recipes[index], isloading: true),
            );
          },
        ),
      ),
    );
  }
}
