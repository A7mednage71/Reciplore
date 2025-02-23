import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';

class WatchVideoButton extends StatelessWidget {
  const WatchVideoButton({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(Routes.watchRecipeVideo, arguments: recipeModel);
      },
      icon: Icon(
        Icons.play_circle,
        color: AppColors.loadingColor,
        size: 40.h,
      ),
    ));
  }
}
