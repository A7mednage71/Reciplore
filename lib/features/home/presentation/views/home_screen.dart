import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_categories_section.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_search_recipe_section.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipes_view.dart';
import 'package:looqma/features/home/presentation/views/widgets/user_info.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          const UserInfo(),
          const HomeSearchRecipeSection(),
          SizedBox(height: 20.h),
          const RecipesView(),
          const HomeCategoriesSection(),
          SizedBox(height: 20.h),
          const NewRecipes(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
