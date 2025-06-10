import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/custom_search_with_ai_text_field.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/widgets/search_recipes_with_ai_result.dart';

class SearchRecipesWithAiScreen extends StatelessWidget {
  const SearchRecipesWithAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Recipe RecSys'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            const CusotmSearchWithAiTextField(),
            SizedBox(height: 20.h),
            const Expanded(child: SearchRecipeWithAiResult()),
          ],
        ),
      ),
    );
  }
}
