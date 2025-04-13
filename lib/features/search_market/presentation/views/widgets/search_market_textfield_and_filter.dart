import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/filter_market_bottom_sheet.dart';

class SearchMarketTextFieldAndFilter extends StatelessWidget {
  const SearchMarketTextFieldAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchMarketCubit = context.read<SearchMarketCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: searchMarketCubit.searchController,
            validator: MyValidators.searchValidator,
            onChanged: (value) {
              searchMarketCubit.onSearchChanged();
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
            hintText: "Search market",
          ),
        ),
        SizedBox(width: 20.w),
        InkWell(
          onTap: () {
            showBottomSheet(context, searchMarketCubit);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              AppAssets.imagesFilter,
            ),
          ),
        )
      ],
    );
  }

  void showBottomSheet(
      BuildContext context, SearchMarketCubit searchMarketCubit) {
    showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: searchMarketCubit,
          child: const FilterMarketBottomSheet(),
        );
      },
    );
  }
}
