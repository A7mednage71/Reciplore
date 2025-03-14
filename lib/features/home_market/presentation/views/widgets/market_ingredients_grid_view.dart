import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';

class MarketIngredientsGridView extends StatelessWidget {
  const MarketIngredientsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 10.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.marketIngredientsDetails);
              },
              child: const MarketIngredientItem());
        },
      ),
    );
  }
}
