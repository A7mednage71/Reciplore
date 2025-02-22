import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowRecipesByCountryLoading extends StatelessWidget {
  const ShowRecipesByCountryLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 30.w),
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
              child: const RecipeItem(recipeModel: null),
            );
          },
        ),
      ),
    );
  }
}
