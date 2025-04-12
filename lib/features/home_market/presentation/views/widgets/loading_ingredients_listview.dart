import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingIngredientsListView extends StatelessWidget {
  const LoadingIngredientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<IngredientDataModel> data = List.from(
      List.generate(
        3,
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
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
          child: MarketIngredientItem(ingredient: data[index]),
        ),
      ),
    );
  }
}
