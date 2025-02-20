import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://res.cloudinary.com/dfdmgqhwa/image/upload/v1738761955/recipesSystem/Categories/Lamb/emob4fwocxqexvgtvizg.png',
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.transparent,
              backgroundImage: imageProvider,
            );
          },
          fit: BoxFit.fill,
        ),
        SizedBox(height: 5.h),
        Text(
          "Miscellaneous",
          style: AppStyles.smallBoldText,
        )
      ],
    );
  }
}
