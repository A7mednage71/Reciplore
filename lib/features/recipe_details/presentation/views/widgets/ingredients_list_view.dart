import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/ingredients_item.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/serve_numbers.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServeNumbers(
            stepsIsCounted: false, length: recipeModel.ingredients.length),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: recipeModel.ingredients.length,
            itemBuilder: (context, index) {
              return IngredientsItem(
                  ingredientModel: recipeModel.ingredients[index]);
            },
          ),
        ),
      ],
    );
  }
}
