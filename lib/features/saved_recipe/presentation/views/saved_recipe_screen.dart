import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipes_bloc_builder.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Text('Saved recipes', style: AppStyles.mediumBoldText),
          SizedBox(height: 10.h),
          const Expanded(child: SavedRecipesBlocBuilder()),
        ],
      ),
    );
  }
}
