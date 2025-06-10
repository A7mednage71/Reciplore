import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/widgets/custom_rate.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_recipe_image.dart';

class SearchRecipeItem extends StatelessWidget {
  const SearchRecipeItem({super.key, required this.recipeModel});
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchRecipeImage(image: recipeModel.images.urls.first.secureUrl),
        Container(
          width: 150.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black12,
                Colors.black26,
                Colors.black,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                CustomRate(rate: "${recipeModel.averageRating}"),
                const Spacer(),
                Text(
                  recipeModel.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.smallBoldWhiteText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
