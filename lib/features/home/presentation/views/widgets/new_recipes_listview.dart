import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_new_recipes/get_new_recipes_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes_item.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_new_recipes_loading.dart';

class NewRecipesListView extends StatelessWidget {
  const NewRecipesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127.h,
      child: BlocBuilder<GetNewRecipesCubit, GetNewRecipesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            failure: (message) => FailureState(hight: 50.h, message: message),
            loading: () {
              return const ShowNewRecipesLoading();
            },
            success: (recipes) {
              return ListView.builder(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                              Routes.showRecipeDetails,
                              arguments: recipes[index]);
                        },
                        child: NewRecipesItem(recipeModel: recipes[index])),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
