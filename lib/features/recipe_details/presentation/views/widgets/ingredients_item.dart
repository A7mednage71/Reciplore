import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IngredientsItem extends StatelessWidget {
  const IngredientsItem({super.key, required this.ingredientModel});
  final IngredientModel ingredientModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: 76.h,
        decoration: BoxDecoration(
          color: AppColors.grayLighter,
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CachedNetworkImage(
                imageUrl: ingredientModel.ingredientData.image.secureUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) {
                  return Skeleton.leaf(
                    enabled: true,
                    child: Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                        color: AppColors.loadingColor,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              flex: 2,
              child: Text(
                ingredientModel.ingredientData.name,
                style: AppStyles.smallBoldText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(width: 3.w),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Text(
                ingredientModel.amount,
                style: AppStyles.smallRegularText
                    .copyWith(color: AppColors.grayLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
