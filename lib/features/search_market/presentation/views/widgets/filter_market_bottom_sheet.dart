import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/apply_filter.dart';
import 'package:looqma/core/common/widgets/filter_rates_listview.dart';
import 'package:looqma/core/common/widgets/reset_filter.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/filter_sort_by_list_view.dart';

class FilterMarketBottomSheet extends StatefulWidget {
  const FilterMarketBottomSheet({super.key});

  @override
  State<FilterMarketBottomSheet> createState() =>
      _FilterMarketBottomSheetState();
}

class _FilterMarketBottomSheetState extends State<FilterMarketBottomSheet> {
  late RangeValues currentRangeValues;
  String? selectedSort;
  String? selectedRate;

  @override
  void initState() {
    super.initState();
    final state = context.read<SearchMarketCubit>().state;
    currentRangeValues =
        RangeValues(double.parse(state.minPrice), double.parse(state.maxPrice));

    selectedSort = state.sort;
    selectedRate = state.rate;
  }

  @override
  Widget build(BuildContext context) {
    final searchMarketCubit = context.read<SearchMarketCubit>();
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
                log(currentRangeValues.start.toString());
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
            selectedValue: selectedSort ?? '',
            onItemSelected: (newSort) {
              setState(() {
                selectedSort = newSort.isEmpty ? null : newSort;
              });
            },
          ),
          SizedBox(height: 20.h),
          Text(
            "Rate",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          FilterRatesListView(
            selectedRate: selectedRate ?? '',
            onRateSelected: (newRate) {
              setState(() {
                selectedRate = newRate.isEmpty ? null : newRate;
              });
            },
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              ResetFilter(
                onTap: () {
                  searchMarketCubit.resetFilters();
                  context.pop();
                },
              ),
              const Spacer(),
              ApplyFilter(
                onTap: () {
                  log(currentRangeValues.start.toString());
                  log(currentRangeValues.end.toString());
                  searchMarketCubit.applyFilters(
                    minPrice: currentRangeValues.start.toStringAsFixed(2),
                    maxPrice: currentRangeValues.end.toStringAsFixed(2),
                    sort: selectedSort,
                    rate: selectedRate,
                  );
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
