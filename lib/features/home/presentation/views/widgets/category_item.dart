import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(Routes.categoryRecipes, arguments: category);
      },
      child: Column(
        children: [
          CachedNetworkCircleAvatar(image: category.categoryImage.secureUrl),
          SizedBox(height: 5.h),
          Text(
            category.categoryName,
            style: AppStyles.smallBoldText,
          )
        ],
      ),
    );
  }
}
