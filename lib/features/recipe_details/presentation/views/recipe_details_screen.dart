import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/dropdown_button.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/recipe_image.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/view_recipe_ingrediants_and_procedure.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CustomPopUpMenueButton(recipeId: recipeModel.id),
          ),
        ],
        elevation: 0,
        title: Text(
          recipeModel.name,
          style: AppStyles.mediumBoldText,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeImage(recipeModel: recipeModel),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text("Category : ",
                    style: AppStyles.smallRegularText
                        .copyWith(color: AppColors.grayLight)),
                Text(
                  recipeModel.category?.name ?? "Category",
                  style: AppStyles.smallBoldText,
                ),
                const Spacer(),
                Text("Country : ",
                    style: AppStyles.smallRegularText
                        .copyWith(color: AppColors.grayLight)),
                Text(
                  recipeModel.country?.name ?? "Country",
                  style: AppStyles.smallBoldText,
                )
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
                child: ViewRecipeIngredientsAndProcedure(
                    recipeModel: recipeModel)),
          ],
        ),
      ),
    );
  }
}
