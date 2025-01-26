import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/dropdown_button.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/recipe_image.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/view_recipe_ingrediants_and_procedure.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: const CustomPopUpMenueButton(),
          ),
        ],
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
            const RecipeImage(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Spicy chicken burger with French fries",
                    style: AppStyles.smallBoldText,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 20.h),
            const Expanded(child: ViewRecipeIngredientsAndProcedure()),
          ],
        ),
      ),
    );
  }
}
