import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_item.dart';

class SearchRecipesGridView extends StatelessWidget {
  const SearchRecipesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SearchRecipeItem();
        },
      ),
    );
  }
}
