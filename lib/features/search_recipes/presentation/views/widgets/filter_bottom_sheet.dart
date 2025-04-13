import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/core/common/widgets/apply_filter.dart';
import 'package:looqma/core/common/widgets/filter_rates_listview.dart';
import 'package:looqma/core/common/widgets/reset_filter.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/select_category_drop_down_Button.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/select_country_drop_down_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key, required this.searchRecipeCubit});

  final SearchRecipeCubit searchRecipeCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Filter Search",
              style: AppStyles.smallBoldText,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Rate",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          FilterRatesListView(
            selectedRate: searchRecipeCubit.selectedRate,
            onRateSelected: (newRate) {
              searchRecipeCubit.selectedRate = newRate;
            },
          ),
          SizedBox(height: 20.h),
          Text(
            "Category",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          SelectCategoryDropDownButton(searchRecipeCubit: searchRecipeCubit),
          SizedBox(height: 10.h),
          Text(
            "Country",
            style: AppStyles.smallBoldText,
          ),
          SizedBox(height: 10.h),
          SelectCountryDropDownButton(searchRecipeCubit: searchRecipeCubit),
          SizedBox(height: 20.h),
          Row(
            children: [
              ApplyFilter(
                onTap: () {
                  searchRecipeCubit.applyFilter();
                  context.pop();
                },
              ),
              const Spacer(),
              ResetFilter(
                onTap: () {
                  searchRecipeCubit.resetFilters();
                  context.pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
