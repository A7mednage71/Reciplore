import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_state.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners_loading.dart';

class MarketBannersBlocBuilder extends StatelessWidget {
  const MarketBannersBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMarketCubit, HomeMarketState>(
      buildWhen: (previous, current) =>
          previous.marketBanners != current.marketBanners,
      builder: (context, state) {
        if (state.status == HomeMarketStatus.initial) {
          return const SizedBox.shrink();
        } else if (state.status == HomeMarketStatus.loading) {
          return const MarketBannersLoadingWidget();
        } else if (state.status == HomeMarketStatus.failure &&
            state.marketBanners == null) {
          return FailureState(hight: 50.h, message: state.message);
        } else {
          return MarketBanners(banners: state.marketBanners!.images);
        }
      },
    );
  }
}
