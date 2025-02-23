import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/save_recipe_button.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.recipeModel});
  final RecipeModel? recipeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 176.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColors.grayLighter,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 66.h,
                ),
                Text(
                  recipeModel?.country?.name ?? "Country name",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppStyles.smallBoldText,
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate",
                          style: AppStyles.smallRegularText
                              .copyWith(color: AppColors.grayLight),
                        ),
                        Row(
                          children: [
                            Text(
                              "${recipeModel?.averageRating ?? "0.0"} ",
                              style: AppStyles.smallRegularText,
                            ),
                            SizedBox(height: 5.h),
                            Image.asset(AppAssets.imagesRateStar)
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const SaveRecipeButton()
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: -50.h,
            right: 25.w,
            child: CachedNetworkImage(
              imageUrl: recipeModel?.images.urls.first.secureUrl ??
                  AppConstants.defaultCategoryImage,
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.transparent,
                  backgroundImage: imageProvider,
                );
              },
              fit: BoxFit.fill,
              errorWidget: (context, url, error) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      const AssetImage(AppConstants.defaultCategoryImage),
                );
              },
              placeholder: (context, url) {
                return CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.loadingColor,
                  backgroundImage:
                      const AssetImage(AppConstants.defaultCategoryImage),
                );
              },
            )),
      ],
    );
  }
}
