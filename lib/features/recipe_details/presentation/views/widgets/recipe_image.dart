import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_assets.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: const DecorationImage(
            image: AssetImage(AppAssets.imagesSavedRecipeTest),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.w),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomRate(rate: "5.6"),
              Spacer(),
              SaveRecipeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
