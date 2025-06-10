import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_countries/get_countries_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/filter_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled
          ? () {
              showBottomSheet(context);
            }
          : null,
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
    );
  }

  void showBottomSheet(BuildContext context) {
    final searchCubit = context.read<SearchRecipeCubit>();
    showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      context: context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<GetCategoriesCubit>()..getCategories(),
            ),
            BlocProvider(
              create: (context) => getIt<GetCountriesCubit>()..getCountries(),
            ),
          ],
          child: FilterBottomSheet(searchRecipeCubit: searchCubit),
        );
      },
    );
  }
}
