import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_grid_skeleton.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_grid_view.dart';

class CategoryRecipesBlocBuider extends StatelessWidget {
  const CategoryRecipesBlocBuider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryRecipesCubit = context.read<GetRecipesByCategoryCubit>();
    return BlocBuilder<GetRecipesByCategoryCubit, GetRecipesByCategoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          failure: (message) => Center(child: FailureState(hight: 100.h)),
          loading: () => const CategoryRecipesGridSkeleton(),
          success: (recipes) {
            if (recipes.isEmpty) return const Center(child: EmptyState());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${recipes.length} /${categoryRecipesCubit.totalRecipeslength} Recipes',
                  style: AppStyles.extraSmallRegularGrayLightText,
                ),
                SizedBox(height: 10.h),
                Expanded(child: CategoryRecipesGridView(recipes: recipes)),
              ],
            );
          },
        );
      },
    );
  }
}
