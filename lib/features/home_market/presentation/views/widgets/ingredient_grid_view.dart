import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/ingredient_item.dart';


class IngredientGridView extends StatelessWidget {
  const IngredientGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return const MarketIngredientItem();
          },
        ),
      ),
    );
  }
}