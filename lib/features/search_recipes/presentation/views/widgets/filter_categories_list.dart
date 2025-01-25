import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/filter_category_item.dart';

class FilterCategoriesList extends StatefulWidget {
  const FilterCategoriesList({super.key});

  @override
  State<FilterCategoriesList> createState() => _FilterCategoriesListState();
}

class _FilterCategoriesListState extends State<FilterCategoriesList> {
  int active = -1;
  @override
  final List<String> categories = [
    "All",
    "Cereal",
    "Vegetables",
    "Dinner",
    "Chinese",
    "Local Dish",
    "Fruit",
    "Breakfast",
    "Spanish",
    "Lunch",
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Wrap(
        spacing: 10.w,
        runSpacing: 5.h,
        children: categories.asMap().entries.map((category) {
          return InkWell(
            onTap: () {
              if (active != category.key) {
                setState(() {
                  active = category.key;
                });
              }
            },
            child: FilterCategoryItem(
              category: category.value,
              isActive: active == category.key,
            ),
          );
        }).toList(),
      ),
    );
  }
}
