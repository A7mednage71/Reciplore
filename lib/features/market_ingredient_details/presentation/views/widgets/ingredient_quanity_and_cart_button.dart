import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/ingredient_details_add_to_cart_button.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/widgets/ingredient_quantity.dart';

class IngredientQuantityAndCartButton extends StatefulWidget {
  const IngredientQuantityAndCartButton({super.key});

  @override
  State<IngredientQuantityAndCartButton> createState() =>
      _IngredientQuantityAndCartButtonState();
}

class _IngredientQuantityAndCartButtonState
    extends State<IngredientQuantityAndCartButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 25.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black26,
            blurRadius: 10.r,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: IngredientQuantity(),
          ),
          SizedBox(width: 16.w),
          const Expanded(
            child: IngredientDetailsAddToCartButton(),
          ),
        ],
      ),
    );
  }
}
