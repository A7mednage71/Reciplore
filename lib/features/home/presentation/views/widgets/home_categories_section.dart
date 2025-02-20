import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_categories_list_view.dart';
import 'package:looqma/features/home/presentation/views/widgets/home_categories_loading.dart';

class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("All Categories", style: AppStyles.normalBoldText),
          SizedBox(height: 15.h),
          BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const HomeCategoriesLoading(),
                success: (categories) =>
                    HomeCategoriesListView(categories: categories),
                failure: (message) => FailureState(hight: 50.h),
              );
            },
          ),
        ],
      ),
    );
  }
}
