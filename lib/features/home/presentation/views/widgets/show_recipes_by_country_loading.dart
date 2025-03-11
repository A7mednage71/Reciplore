import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowRecipesByCountryLoading extends StatelessWidget {
  const ShowRecipesByCountryLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = List.generate(
      2,
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

    return Skeletonizer(
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 30.w),
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
              child: RecipeItem(recipeModel: recipes[index]),
            );
          },
        ),
      ),
    );
  }
}
