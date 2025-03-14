import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_back_arrow_app_bar.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/ingredient_content.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/quantity_and_add_to_cart.dart';

class MarketIngredientDetailsScreen extends StatelessWidget {
  const MarketIngredientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.all(18.r),
        child: const QuantityAndAddToCart(),
      ),
      appBar: const CustombackArrowAppbar(arrowBackColor: AppColors.white),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Image.asset(
              AppAssets.imagesFresh,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: const IngredientContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
