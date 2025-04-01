import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/common/widgets/custom_back_arrow_app_bar.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/discount_badge.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/ingredient_details_cached_image.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/ingredient_quanity_and_cart_button.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/show_ingredient_data.dart';

class MarketIngredientDetailsScreen extends StatelessWidget {
  const MarketIngredientDetailsScreen(
      {super.key, required this.ingredientDataModel});
  final IngredientDataModel ingredientDataModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      appBar: const CustombackArrowAppbar(),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          IngredientDetailsCachedImage(
              image: ingredientDataModel.image.secureUrl),
          if (ingredientDataModel.discount.amount > 4)
            Positioned(
              top: 40,
              right: 20,
              height: 40,
              child: DiscountBadge(
                discountPercentage: ingredientDataModel.discount.amount.toInt(),
              ),
            ),
        ],
      ),
      bottomSheet: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.r),
          ),
        ),
        child: ShowIngredientData(ingredient: ingredientDataModel),
      ),
      bottomNavigationBar: const IngredientQuantityAndCartButton(),
    );
  }
}
