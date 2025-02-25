import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/searchLottie.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_result.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SearchLottie(),
          failure: (errorMessage) => Expanded(
            child: Center(
                child: FailureState(hight: 100.h, message: errorMessage)),
          ),
          loading: () => Expanded(
            child: Center(
              child:
                  SpinKitFadingCircle(color: AppColors.primaryDark, size: 60.r),
            ),
          ),
          success: (recipes) => Expanded(
            child: recipes.isEmpty
                ? const Center(child: EmptyState(message: 'No Recipes Found'))
                : SearchResult(recipes: recipes),
          ),
        );
      },
    );
  }
}
