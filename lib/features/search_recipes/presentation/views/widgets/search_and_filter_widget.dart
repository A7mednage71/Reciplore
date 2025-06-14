import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/filter_button.dart';

class SearchAndFilterWidget extends StatelessWidget {
  const SearchAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchRecipeCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: searchCubit.searchController,
            validator: MyValidators.searchValidator,
            onChanged: (value) {
              searchCubit.onSearchChanged();
              return null;
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            keyboardType: TextInputType.text,
            prefixIcon: Image.asset(
              AppAssets.imagesSearchIcon,
              height: 20.h,
              width: 20.w,
            ),
            hintText: "Search recipe",
          ),
        ),
        SizedBox(width: 20.w),
        const FilterButton(enabled: true),
      ],
    );
  }
}
