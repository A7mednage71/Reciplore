import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/widgets/custom_drop_down_button.dart';
import 'package:looqma/features/home/presentation/cubit/get_countries/get_countries_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';

class SelectCountryDropDownButton extends StatelessWidget {
  const SelectCountryDropDownButton({
    super.key,
    required this.searchRecipeCubit,
  });
  final SearchRecipeCubit searchRecipeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCountriesCubit, GetCountriesState>(
      builder: (context, state) {
        return state.maybeMap(
          success: (countries) {
            String? chosenCountryName;
            if (searchRecipeCubit.selectedCountryId != null) {
              chosenCountryName = countries.allCountriesModel.countries
                  .firstWhere(
                      (e) => e.countryId == searchRecipeCubit.selectedCountryId)
                  .countryName;
            }
            return CustomDropdownButtonFormField(
              hint: 'Select a country',
              chosenValue: chosenCountryName,
              items: countries.allCountriesModel.countries
                  .map((e) => e.countryName)
                  .toList(),
              onChanged: (value) {
                searchRecipeCubit.selectedCountryId = countries
                    .allCountriesModel.countries
                    .firstWhere((e) => e.countryName == value)
                    .countryId;
              },
            );
          },
          orElse: () {
            return CustomDropdownButtonFormField(
              hint: 'Select a country',
              items: const [],
              onChanged: (value) {},
            );
          },
        );
      },
    );
  }
}
