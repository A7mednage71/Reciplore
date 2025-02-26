import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/category_recipes/presentation/views/widgets/category_recipes_grid_view.dart';

class CategoryRecipesBlocBuider extends StatelessWidget {
  const CategoryRecipesBlocBuider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecipesByCategoryCubit, GetRecipesByCategoryState>(
      builder: (context, state) {
        final categoryRecipesCubit = context.read<GetRecipesByCategoryCubit>();

        return state.when(
          initial: () => const SizedBox.shrink(),
          failure: (message) => Center(child: FailureState(hight: 100.h)),
          loading: () => Center(
              child: SpinKitFadingCircle(
                  color: AppColors.primaryDark, size: 60.r)),
          success: (recipes) {
            if (recipes.isEmpty) return const Center(child: EmptyState());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${recipes.length} /${categoryRecipesCubit.totalRecipeslength} Recipes',
                  style: AppStyles.extraSmallRegularText
                      .copyWith(color: Colors.grey),
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
