import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/filter_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled
          ? () {
              showBottomSheet(context);
            }
          : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Image.asset(
          AppAssets.imagesFilter,
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      context: context,
      builder: (context) {
        return const FilterBottomSheet();
      },
    );
  }
}
