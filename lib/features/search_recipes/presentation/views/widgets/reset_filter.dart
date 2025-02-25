import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';

class ResetFilter extends StatelessWidget {
  const ResetFilter({super.key, required this.searchRecipeCubit});
  final SearchRecipeCubit searchRecipeCubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          searchRecipeCubit.resetFilters();
          context.pop();
        },
        child: Container(
          height: 40.h,
          width: 150.w,
          decoration: const BoxDecoration(
            color: AppColors.secondaryLight,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Reset",
              style: AppStyles.smallBoldText.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
