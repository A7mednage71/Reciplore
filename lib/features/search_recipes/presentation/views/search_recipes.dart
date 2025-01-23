import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_and_filter_widget.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_recipes_appbar.dart';

class SearchRecipes extends StatelessWidget {
  const SearchRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchRecipesAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          const SearchAndFilterWidget(),
        ],
      ),
    );
  }
}
