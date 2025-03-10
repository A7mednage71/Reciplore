import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipe_loading_listview.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipes_list_view.dart';

class SavedRecipesBlocBuilder extends StatelessWidget {
  const SavedRecipesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedRecipesCubit, GetSavedRecipesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          failure: (message) => FailureState(hight: 50.h, message: message),
          loading: () => const SavedRecipesLoading(),
          success: (savedRecipes) =>
              SavedRecipesListView(savedRecipes: savedRecipes),
        );
      },
    );
  }
}
