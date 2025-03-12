import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class QuantityAndAddToCart extends StatefulWidget {
  const QuantityAndAddToCart({super.key});

  @override
  State<QuantityAndAddToCart> createState() => _QuantityAndAddToCartState();
}

class _QuantityAndAddToCartState extends State<QuantityAndAddToCart>
    with SingleTickerProviderStateMixin {
  int quantity = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDark,
                  width: 1.8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                child: const Icon(
                  Icons.remove,
                  size: 20,
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDark,
                  width: 1.8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity++;
                    });
                  }
                },
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Add to Cart',
              style:
                  AppStyles.mediumRegularText.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
