import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';

class MarketHomeInfoData extends StatelessWidget {
  const MarketHomeInfoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeMarketCubit = context.read<HomeMarketCubit>();
    final cartCubit = context.read<CartCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reciplore Market", style: AppStyles.largeBoldText),
              SizedBox(height: 5.h),
              Text("Get the best ingredients and\nstart cooking today!",
                  style: AppStyles.smallRegularText
                      .copyWith(color: AppColors.grayLight)),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pushNamed(
                Routes.cart,
                arguments: {
                  'homeMarketCubit': homeMarketCubit,
                  'cartCubit': cartCubit,
                },
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.secondaryMedium,
              size: 30.w,
            ),
          )
        ],
      ),
    );
  }
}
