import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_categories_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategoriesLoading extends StatelessWidget {
  const HomeCategoriesLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: HomeCategoriesListView(
        categories: List.generate(
          3,
          (index) => CategoryModel(
            categoryId: '',
            categoryName: 'CategoryName',
            categoryDescription: '',
            categoryImage: CategoryImageModel(
              secureUrl: AppConstants.defaultCategoryImage,
              publicUrl: '',
            ),
          ),
        ),
      ),
    );
  }
}
