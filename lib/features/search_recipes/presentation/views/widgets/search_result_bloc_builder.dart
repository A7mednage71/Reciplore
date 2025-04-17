import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/searchLottie.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_view_skeleton.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_result.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SearchLottie(),
            failure: (errorMessage) => Center(
                child: FailureState(hight: 100.h, message: errorMessage)),
            loading: () => const SearchGridViewSkeleton(),
            success: (recipes) => recipes.isEmpty
                ? const Center(child: EmptyState(message: 'No Recipes Found'))
                : SearchResult(recipes: recipes),
          );
        },
      ),
    );
  }
}
