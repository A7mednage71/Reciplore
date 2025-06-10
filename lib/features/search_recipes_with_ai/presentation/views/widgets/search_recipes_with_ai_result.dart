import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/searchLottie.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/cubit/search_recipes_with_ai/search_recipes_with_ai_cubit.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/search_recipes_with_ai_loading_skeleton.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/search_recipes_with_ai_result_grid_view.dart';

class SearchRecipeWithAiResult extends StatelessWidget {
  const SearchRecipeWithAiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecipesWithAiCubit, SearchRecipesWithAiState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.when(
          initial: () => const SearchLottie(),
          loading: () {
            return const SearchRecipeWithAiResultLoadingSkeleton();
          },
          success: (recipes) {
            return SearchRecipeWithAiResultGridView(recipes: recipes);
          },
          failure: (message) {
            return FailureState(hight: 50.h, message: message);
          },
        );
      },
    );
  }
}
