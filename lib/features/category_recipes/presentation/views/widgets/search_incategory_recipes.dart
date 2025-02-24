import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';

class SearchInCategoryRecipes extends StatelessWidget {
  const SearchInCategoryRecipes({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      validator: null,
      onChanged: (value) => null,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      keyboardType: TextInputType.text,
      prefixIcon: Image.asset(
        AppAssets.imagesSearchIcon,
        height: 20.h,
        width: 20.w,
      ),
      hintText: "Search in ${category.categoryName}",
    );
  }
}
