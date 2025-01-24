import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/rate_filter_item.dart';

class FilterRatesListView extends StatefulWidget {
  const FilterRatesListView({super.key});

  @override
  State<FilterRatesListView> createState() => _FilterRatesListViewState();
}

class _FilterRatesListViewState extends State<FilterRatesListView> {
  int active = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (active != index) {
                setState(() {
                  active = index;
                });
              }
            },
            child: RateFilterItem(
              isActive: active == index,
              rateValue: index + 1,
            ),
          );
        },
      ),
    );
  }
}
