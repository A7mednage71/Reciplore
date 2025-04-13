import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/apply_filter.dart';
import 'package:looqma/core/common/widgets/filter_rates_listview.dart';
import 'package:looqma/core/common/widgets/reset_filter.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/filter_sort_by_list_view.dart';

class FilterMarketBottomSheet extends StatefulWidget {
  const FilterMarketBottomSheet({super.key});

  @override
  State<FilterMarketBottomSheet> createState() =>
      _FilterMarketBottomSheetState();
}

class _FilterMarketBottomSheetState extends State<FilterMarketBottomSheet> {
  RangeValues currentRangeValues = const RangeValues(4.20, 30.52);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Filter Search",
              style: AppStyles.smallBoldText,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Price",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 5.h),
          RangeSlider(
            values: currentRangeValues,
            min: 0,
            max: 100,
            divisions: 200,
            activeColor: AppColors.primaryDark,
            inactiveColor: AppColors.primaryMedium,
            labels: RangeLabels(
              "\$${currentRangeValues.start.toStringAsFixed(2)}",
              "\$${currentRangeValues.end.toStringAsFixed(2)}",
            ),
            onChanged: (RangeValues values) {
              setState(() {
                currentRangeValues = values;
              });
            },
          ),
          SizedBox(height: 10.h),
          Text(
            "Sort By",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          FilterSortByListView(
            selectedValue: '',
            onItemSelected: (p0) {},
          ),
          SizedBox(height: 20.h),
          Text(
            "Rate",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          FilterRatesListView(
            // selectedRate: searchRecipeCubit.selectedRate,
            selectedRate: '2',
            onRateSelected: (newRate) {
              // searchRecipeCubit.selectedRate = newRate;
            },
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              ApplyFilter(
                onTap: () {
                  // searchRecipeCubit.applyFilter();
                  context.pop();
                },
              ),
              const Spacer(),
              ResetFilter(
                onTap: () {
                  // searchRecipeCubit.resetFilters();
                  context.pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
