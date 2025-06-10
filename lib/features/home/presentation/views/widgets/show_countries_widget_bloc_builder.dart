import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';
import 'package:looqma/features/home/presentation/cubit/get_countries/get_countries_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/countries_tab_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowCountriesWidgetBlocBuilder extends StatelessWidget {
  const ShowCountriesWidgetBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCountriesCubit, GetCountriesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () {
            return Skeletonizer(
              child: CountriesTabsWidget(
                isloading: true,
                countries: List.generate(
                    5,
                    (index) =>
                        CountryModel(countryId: '', countryName: 'loading')),
                // Add loading state
              ),
            );
          },
          success: (allCountries) {
            return CountriesTabsWidget(
              countries: allCountries.countries,
            );
          },
          failure: (message) {
            return FailureState(hight: 30.h);
          },
        );
      },
    );
  }
}
