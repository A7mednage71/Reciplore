import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes_listview.dart';

class NewRecipes extends StatelessWidget {
  const NewRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Recipes",
            style: AppStyles.normalBoldText,
          ),
          SizedBox(height: 10.h),
          const NewRecipesListView(),
        ],
      ),
    );
  }
}
