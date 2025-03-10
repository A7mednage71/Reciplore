import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_search_recipe_section.dart';

class SearchAndCart extends StatelessWidget {
  const SearchAndCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: Row(
        children: [
          const Expanded(
              child: HomeSearchRecipeSection(hintText: "Search for ingredients")),
          CircleAvatar(
            backgroundColor: AppColors.primaryMedium,
            radius: 18.r,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
          ),
        ],
      ),
    );
  }
}
