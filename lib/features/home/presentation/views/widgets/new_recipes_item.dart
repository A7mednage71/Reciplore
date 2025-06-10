import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/views/widgets/rating_stars.dart';

class NewRecipesItem extends StatelessWidget {
  const NewRecipesItem({super.key, required this.recipeModel});
  final RecipeModel? recipeModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 120.h,
        width: 251.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeModel?.name ?? "Test Recipe Model",
                      style: AppStyles.smallBoldText,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    RatingStars(rating: recipeModel?.averageRating ?? 0),
                    SizedBox(height: 10.h),
                    Text("Category",
                        style: AppStyles.smallRegularGrayLightText),
                    Text(recipeModel?.category?.name ?? "Category",
                        style: AppStyles.smallRegularText),
                  ],
                ),
              ),
              CachedNetworkCircleAvatar(
                  image: recipeModel?.images.urls.first.secureUrl),
            ],
          ),
        ),
      ),
    );
  }
}
