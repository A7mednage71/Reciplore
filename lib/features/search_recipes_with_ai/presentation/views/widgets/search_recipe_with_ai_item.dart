import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_recipe_image.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';

class SearchRecipeWithAiItem extends StatelessWidget {
  const SearchRecipeWithAiItem({super.key, required this.recipe});
  final EnhancedRecipe recipe;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchRecipeImage(image: recipe.image.imageUrl),
        Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black26,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  recipe.recipeData.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.smallBoldWhiteText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
