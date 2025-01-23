import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipes_view.dart';
import 'package:looqma/features/home/presentation/views/widgets/search_recipe_section.dart';
import 'package:looqma/features/home/presentation/views/widgets/user_info.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        const UserInfo(),
        const SearchRecipeSection(),
        SizedBox(height: 20.h),
        const RecipesView(),
        const NewRecipes(),
      ],
    );
  }
}
