import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartListviewSkeleton extends StatelessWidget {
  const CartListviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartIngredientModel> cartIngredients = List.generate(
        6,
        (index) => CartIngredientModel(
              cartIngredientId: index.toString(),
              quantity: 1,
              price: 0.0,
              ingredient: IngredientDataModel(
                id: index.toString(),
                name: 'Loading ',
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
            ));
    return Expanded(
      child: Skeletonizer(
        containersColor: AppColors.white,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 10.h),
          itemCount: cartIngredients.length,
          itemBuilder: (context, index) =>
              CartItem(cartIngredientModel: cartIngredients[index]),
        ),
      ),
    );
  }
}
