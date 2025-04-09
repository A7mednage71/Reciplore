import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_state.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/loading_ingredients_listview.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BlocBuilder<HomeMarketCubit, HomeMarketState>(
        buildWhen: (previous, current) =>
            previous.bestSellingList != current.bestSellingList,
        builder: (context, state) {
          if (state.status == HomeMarketStatus.initial) {
            return const SizedBox.shrink();
          } else if (state.status == HomeMarketStatus.loading) {
            return const LoadingIngredientsListView();
          } else if (state.status == HomeMarketStatus.failure) {
            return FailureState(hight: 50.h, message: state.message);
          } else if (state.bestSellingList.isEmpty) {
            return const EmptyState(message: 'No ingredients found');
          } else {
            return ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushNamed(
                        Routes.marketIngredientsDetails,
                        arguments: state.bestSellingList[index]);
                  },
                  child: MarketIngredientItem(
                    ingredient: state.bestSellingList[index],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
