import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_and_filter_widget.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_result_bloc_builder.dart';

class SearchRecipes extends StatelessWidget {
  const SearchRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search Recipes'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const SearchAndFilterWidget(),
            SizedBox(height: 20.h),
            const SearchResultBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
