import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';

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
        onTap: (value) {},
      ),
    );
  }
}
