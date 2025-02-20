import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_constants.dart';
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
      onTap: () {},
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: category.categoryImage.secureUrl,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.transparent,
                backgroundImage: imageProvider,
              );
            },
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    const AssetImage(AppConstants.defaultCategoryImage),
              );
            },
          ),
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
