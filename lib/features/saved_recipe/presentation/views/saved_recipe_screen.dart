import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipes_bloc_builder.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Stack(
            alignment: Alignment.center,
            children: [
              Text('Saved recipes', style: AppStyles.mediumBoldText),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      context.read<GetSavedRecipesCubit>().getSavedRecipes();
                    },
                    icon: const Icon(Icons.refresh_outlined,
                        color: AppColors.primaryDarker),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SavedRecipesBlocBuilder()),
        ],
      ),
    );
  }
}
