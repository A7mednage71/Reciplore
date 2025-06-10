import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class IngredientsGridViewSkeleton extends StatelessWidget {
  const IngredientsGridViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<IngredientDataModel> data = List.from(
      List.generate(
        6,
        (index) => IngredientDataModel(
          id: '',
          name: 'Ingredient name',
          image: ImageURL(
              secureUrl:
                  'https://res.cloudinary.com/dfdmgqhwa/image/upload/v1741991832/recipesSystem/ingredients/tqtmnjozmt2nve3lk7yd.png'),
          description: '',
          appliedPrice: 0,
          averageRating: 0,
          basePrice: 0,
          discount: Discount(amount: 1, type: ''),
          stock: 0,
          inCart: false,
        ),
      ),
    );
    return Skeletonizer(
      containersColor: AppColors.white,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.69,
        ),
        itemBuilder: (context, index) {
          return MarketIngredientItem(
            ingredient: data[index],
          );
        },
      ),
    );
  }
}
