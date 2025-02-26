import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_bloc_builder.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';

class CategoryRecipes extends StatelessWidget {
  const CategoryRecipes({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${category.categoryName} Recipes'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const Expanded(
              child: CategoryRecipesBlocBuider(),
            ),
          ],
        ),
      ),
    );
  }
}
