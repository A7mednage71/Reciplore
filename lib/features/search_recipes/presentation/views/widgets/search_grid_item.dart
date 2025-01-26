import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';

class SearchRecipeItem extends StatelessWidget {
  const SearchRecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesSearchTest,
          width: 150.w,
          height: 150.h,
          fit: BoxFit.cover,
        ),
        Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black26,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                const CustomRate(rate: "4.5"),
                const Spacer(),
                Text(
                  "Traditional spare ribs baked",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.smallBoldText.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
