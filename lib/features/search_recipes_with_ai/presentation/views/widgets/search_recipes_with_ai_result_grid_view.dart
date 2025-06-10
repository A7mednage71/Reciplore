import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/search_recipe_with_ai_item.dart';

class SearchRecipeWithAiResultGridView extends StatelessWidget {
  const SearchRecipeWithAiResultGridView({super.key, required this.recipes});
  final List<EnhancedRecipe> recipes;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: AnimationConfiguration.staggeredGrid(
              columnCount: 2,
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FadeInAnimation(
                  child: SearchRecipeWithAiItem(recipe: recipes[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
