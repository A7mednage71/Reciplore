import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';

class CategoryRecipesGridView extends StatelessWidget {
  const CategoryRecipesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 60.h), // Adds spacing at the top
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 50.h,
        childAspectRatio: 0.8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(Routes.showRecipeDetails);
          },
          child: const RecipeItem(recipeModel: null),
        );
      },
    );
  }
}
