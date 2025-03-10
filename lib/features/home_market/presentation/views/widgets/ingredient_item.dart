import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.grayLight,
            blurRadius: 1,
            offset: Offset(2, 2), // Shadow position
          ),
        ],
        color: AppColors.white,
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r)),
                image: const DecorationImage(
                    image: AssetImage(AppAssets.imagesRedChili),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fresh Red Chili', style: AppStyles.smallBoldText),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Rp 12,000",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.successColor)),
                      TextSpan(
                          text: "/kg",
                          style: AppStyles.extraSmallRegularText
                              .copyWith(color: AppColors.grayLight)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text('Rp 14,000 ',
                    style: AppStyles.extraSmallRegularText.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.grayLight)),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline_outlined,
                          color: AppColors.primaryDark,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
