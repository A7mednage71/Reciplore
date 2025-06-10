import 'package:flutter/material.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_banners.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MarketBannersLoadingWidget extends StatelessWidget {
  const MarketBannersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ImageURL> banners = [
      ImageURL(
          secureUrl:
              'https://img.freepik.com/free-psd/new-collection-fashion-sale-web-banner-template_120329-1507.jpg?semt=ais_hybrid'),
      ImageURL(
          secureUrl:
              'https://img.freepik.com/premium-psd/special-black-friday-women-bag-sale-banner-template_361928-1604.jpg?semt=ais_hybrid'),
      ImageURL(
          secureUrl:
              'https://img.freepik.com/premium-psd/modern-furniture-sale-banner-design_345426-597.jpg?w=740'),
    ];
    return Skeletonizer(child: MarketBanners(banners: banners));
  }
}
