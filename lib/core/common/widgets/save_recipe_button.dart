import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/utils/app_colors.dart';

class SaveRecipeButton extends StatelessWidget {
  const SaveRecipeButton(
      {super.key, required this.isSaved, required this.onPressed});
  final bool isSaved;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeSaveToggleCubit, RecipeSaveToggleState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return CircleAvatar(
          radius: 14.r,
          backgroundColor: AppColors.white,
          child: IconButton(
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: Icon(
              isSaved ? IconlyBold.bookmark : IconlyLight.bookmark,
            ),
            color: AppColors.primaryDark,
            iconSize: 18.sp,
          ),
        );
      },
    );
  }
}
