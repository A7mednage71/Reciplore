import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_bloc_builder.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';

class CategoryRecipes extends StatefulWidget {
  const CategoryRecipes({super.key, required this.category});
  final CategoryModel category;

  @override
  State<CategoryRecipes> createState() => _CategoryRecipesState();
}

class _CategoryRecipesState extends State<CategoryRecipes> {
  @override
  void initState() {
    context.read<GetRecipesByCategoryCubit>().getRecipesByCategory(
        categoryId: widget.category.categoryId, isRefresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${widget.category.categoryName} Recipes'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const Expanded(
              child: CategoryRecipesBlocBuider(),
            ),
          ],
        ),
      ),
    );
  }
}
