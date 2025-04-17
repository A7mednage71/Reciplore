import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';

class CountriesTabsWidget extends StatelessWidget {
  const CountriesTabsWidget({
    super.key,
    required this.countries,
    this.isloading = false,
  });

  final List<CountryModel> countries;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    final getRecipesByCountryCubit = context.read<GetRecipesByCountryCubit>();
    return DefaultTabController(
      length: countries.length + 1,
      child: TabBar(
        padding: EdgeInsets.only(left: 30.w),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        isScrollable: true,
        tabs: [
          const Tab(text: "All"),
          ...List.generate(countries.length,
              (index) => Tab(text: countries[index].countryName))
        ],
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primaryDark,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.center,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isloading ? AppColors.loadingColor : AppColors.primaryDark,
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: (value) {
          if (value == 0) {
            if (getRecipesByCountryCubit.selectedCountryId != null) {
              getRecipesByCountryCubit.getRecipesByCountry(isRefresh: true);
            }
            return;
          } else {
            if (getRecipesByCountryCubit.selectedCountryId !=
                countries[value - 1].countryId) {
              getRecipesByCountryCubit.getRecipesByCountry(
                  countryId: countries[value - 1].countryId, isRefresh: true);
            }
          }
        },
      ),
    );
  }
}
