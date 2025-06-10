import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_item.dart';

class SearchRecipesGridView extends StatefulWidget {
  const SearchRecipesGridView({super.key, required this.recipes});
  final List<RecipeModel> recipes;

  @override
  State<SearchRecipesGridView> createState() => _SearchRecipesGridViewState();
}

class _SearchRecipesGridViewState extends State<SearchRecipesGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<SearchRecipeCubit>();

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !cubit.isFetching &&
        cubit.hasNextPage) {
      cubit.searchRecipes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
        ),
        itemCount: widget.recipes.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                  Routes.showRecipeDetails,
                  arguments: widget.recipes[index]);
            },
            child: AnimationConfiguration.staggeredGrid(
              columnCount: 2,
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FadeInAnimation(
                  child: SearchRecipeItem(recipeModel: widget.recipes[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
