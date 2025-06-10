import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/cubit/search_recipes_with_ai/search_recipes_with_ai_cubit.dart';

class CusotmSearchWithAiTextField extends StatelessWidget {
  const CusotmSearchWithAiTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchWithAiCubit = context.read<SearchRecipesWithAiCubit>();
    return CustomTextField(
      controller: searchWithAiCubit.searchController,
      validator: MyValidators.searchValidator,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      keyboardType: TextInputType.text,
      hintText: "ُWhat’s in your kitchen? (e.g.pasta)",
      suffixIcon: InkWell(
        onTap: () async {
          await searchWithAiCubit.searchWithAi();
        },
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
        child: Container(
          margin: EdgeInsets.all(1.r),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
          child: const Icon(
            Icons.search,
            color: AppColors.primaryDarker,
          ),
        ),
      ),
    );
  }
}
