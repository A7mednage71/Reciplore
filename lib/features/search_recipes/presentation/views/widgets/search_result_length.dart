import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';

class SearchResultLength extends StatelessWidget {
  const SearchResultLength({
    super.key,
    required this.searchResultLength,
  });
  final int searchResultLength;
  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchRecipeCubit>();
    return Row(
      children: [
        Text(
          'Search Result',
          style: AppStyles.mediumBoldText,
        ),
        const Spacer(),
        Text(
          '$searchResultLength /${searchCubit.totalRecipesLength} results',
          style: AppStyles.extraSmallRegularText.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
