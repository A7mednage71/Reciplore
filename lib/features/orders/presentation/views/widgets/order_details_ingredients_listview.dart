import 'package:flutter/material.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_details_ingredient_item.dart';

class OrderDetailsIngredientsListView extends StatelessWidget {
  const OrderDetailsIngredientsListView({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: order.orderIngredients.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderDetailsIngredientItem(
            ingredientModel: order.orderIngredients[index]);
      },
    );
  }
}
