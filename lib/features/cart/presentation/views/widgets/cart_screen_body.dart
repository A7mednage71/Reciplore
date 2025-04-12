import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_total_section.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({
    super.key,
    required this.cartReponseModel,
  });

  final GetCartReponseModel cartReponseModel;

  @override
  Widget build(BuildContext context) {
    final cartIngredients = cartReponseModel.cart!.ingredients;
    return Column(
      children: [
        Expanded(
          child: AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 10.h),
              itemCount: cartIngredients.length,
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 100.0,
                  child: FadeInAnimation(
                      child: CartItem(
                          cartIngredientModel: cartIngredients[index])),
                ),
              ),
            ),
          ),
        ),
        CartTotalSection(cartDataModel: cartReponseModel.cart!),
      ],
    );
  }
}
