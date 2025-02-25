import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/widgets/custom_drop_down_button.dart';
import 'package:looqma/features/home/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';

class SelectCategoryDropDownButton extends StatefulWidget {
  const SelectCategoryDropDownButton({
    super.key,
    required this.searchRecipeCubit,
  });

  final SearchRecipeCubit searchRecipeCubit;

  @override
  State<SelectCategoryDropDownButton> createState() =>
      _SelectCategoryDropDownButtonState();
}

class _SelectCategoryDropDownButtonState
    extends State<SelectCategoryDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        return state.maybeMap(
          success: (categories) {
            String? chosenCategory;
            if (widget.searchRecipeCubit.selectedCategoryId != null) {
              chosenCategory = categories.categories
                  .firstWhere((e) =>
                      e.categoryId ==
                      widget.searchRecipeCubit.selectedCategoryId)
                  .categoryName;
            }

            return CustomDropdownButtonFormField(
              hint: 'Select a category',
              chosenValue: chosenCategory,
              items: categories.categories.map((e) => e.categoryName).toList(),
              onChanged: (value) {
                widget.searchRecipeCubit.selectedCategoryId = categories
                    .categories
                    .firstWhere((e) => e.categoryName == value)
                    .categoryId;
              },
            );
          },
          orElse: () {
            return CustomDropdownButtonFormField(
              hint: 'Select a category',
              items: const [],
              onChanged: (value) {},
            );
          },
        );
      },
    );
  }
}
