import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/rate_filter_item.dart';

class FilterRatesListView extends StatefulWidget {
  const FilterRatesListView({
    super.key,
    required this.selectedRate,
    required this.onRateSelected,
  });

  final String selectedRate;
  final Function(String) onRateSelected;

  @override
  State<FilterRatesListView> createState() => _FilterRatesListViewState();
}

class _FilterRatesListViewState extends State<FilterRatesListView> {
  int active = -1;

  @override
  void initState() {
    if (widget.selectedRate != "0") {
      active = int.parse(widget.selectedRate) - 1;
    }
    super.initState();
  }

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
                  widget.onRateSelected("${index + 1}");
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
