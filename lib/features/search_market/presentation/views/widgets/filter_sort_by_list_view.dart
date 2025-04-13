import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/search_market/data/models/sort_option_model.dart';

class FilterSortByListView extends StatefulWidget {
  const FilterSortByListView({
    super.key,
    required this.selectedValue,
    required this.onItemSelected,
  });

  final String selectedValue;
  final Function(String) onItemSelected;

  @override
  State<FilterSortByListView> createState() => _FilterSortByListViewState();
}

class _FilterSortByListViewState extends State<FilterSortByListView> {
  int active = -1;

  List<SortOptionModel> sortOptions = [
    SortOptionModel(label: "Best Selling", value: "-sellings"),
    SortOptionModel(label: "Newest", value: "-createdAt"),
    SortOptionModel(label: "Price Low to High", value: "price"),
    SortOptionModel(label: "Price High to Low", value: "-price"),
  ];

  @override
  void initState() {
    if (widget.selectedValue.isNotEmpty) {
      active = sortOptions.indexWhere((e) => e.value == widget.selectedValue);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sortOptions.length,
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemBuilder: (context, index) {
          final item = sortOptions[index];
          final isActive = active == index;

          return InkWell(
            onTap: () {
              if (active != index) {
                setState(() {
                  active = index;
                  widget.onItemSelected(item.value);
                });
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: isActive ? AppColors.primaryDark : Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isActive
                        ? AppColors.primaryDark
                        : AppColors.primaryDarker,
                    width: 1.5,
                  )),
              child: Center(
                child: Text(
                  item.label,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
