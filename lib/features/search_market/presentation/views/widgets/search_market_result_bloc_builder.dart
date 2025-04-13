import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/search_market_result_grid_view.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/searchLottie.dart';

class SearchMarketResultBlocBuilder extends StatelessWidget {
  const SearchMarketResultBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchMarketCubit, SearchMarketState>(
        buildWhen: (previous, current) =>
            previous.ingredients != current.ingredients,
        builder: (context, state) {
          if (state.status == SearchMarketStatus.initial) {
            return const SearchLottie();
          } else if (state.status == SearchMarketStatus.loading) {
            return Center(
              child:
                  SpinKitFadingCircle(color: AppColors.primaryDark, size: 60.r),
            );
          } else if (state.status == SearchMarketStatus.failure) {
            return FailureState(hight: 50.h, message: state.message);
          } else if (state.ingredients.isEmpty) {
            return const EmptyState(message: 'No ingredients found');
          } else {
            final ingredients = state.ingredients;
            return MarketSearchResultGridView(ingredients: ingredients);
          }
        },
      ),
    );
  }
}
