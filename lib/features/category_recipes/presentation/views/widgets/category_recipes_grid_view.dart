import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';

class CategoryRecipesGridView extends StatefulWidget {
  const CategoryRecipesGridView({super.key, required this.recipes});
  final List<RecipeModel> recipes;

  @override
  State<CategoryRecipesGridView> createState() =>
      _CategoryRecipesGridViewState();
}

class _CategoryRecipesGridViewState extends State<CategoryRecipesGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<GetRecipesByCategoryCubit>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.6 &&
        !cubit.isFetching &&
        cubit.hasNextPage) {
      cubit.getRecipesByCategory();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 60.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 50.h,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.recipes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(
                Routes.showRecipeDetails,
                arguments: widget.recipes[index]);
          },
          child: RecipeItem(recipeModel: widget.recipes[index]),
        );
      },
    );
  }
}
