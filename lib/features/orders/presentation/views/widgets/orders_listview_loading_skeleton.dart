import 'package:flutter/material.dart';
import 'package:looqma/core/common/models/address_model.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_constants.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/views/widgets/orders_list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersListViewLoadingSkeleton extends StatelessWidget {
  const OrdersListViewLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> orders = List.generate(
      5,
      (index) => OrderModel(
        orderStatus: 'pending',
        id: '123456789101112',
        orderedAt: '2023-05-22T10:00:00.000Z',
        paymentMethod: 'cash',
        subTotal: 0,
        total: 12345,
        userId: '888',
        estimatedDeliveryDate: '2023-05-22T10:00:00.000Z',
        deliveryAddress: AddressModel(
          streetName: '',
          city: '',
          country: '',
          postalCode: 00000,
          addressLabel: '',
          buildingNumber: "",
          createdAt: '',
          floorNumber: 0,
          id: '',
          isDefault: false,
          notes: '',
          userId: '',
        ),
        contactNumber: '',
        couponId: '',
        shippingFee: 0,
        vat: 0,
        orderIngredients: [
          OrderIngredientModel(
            orderIngredientId: '',
            quantity: 0,
            price: 0,
            ingredientData: IngredientDataModel(
              id: '',
              stock: 0,
              appliedPrice: 0,
              averageRating: 0,
              basePrice: 0,
              description: '',
              discount: Discount(amount: 0, type: ''),
              inCart: false,
              name: '',
              image: ImageURL(secureUrl: AppConstants.dummyIngredientImage),
            ),
          ),
          OrderIngredientModel(
            orderIngredientId: '',
            quantity: 0,
            price: 0,
            ingredientData: IngredientDataModel(
              id: '',
              stock: 0,
              appliedPrice: 0,
              averageRating: 0,
              basePrice: 0,
              description: '',
              discount: Discount(amount: 0, type: ''),
              inCart: false,
              name: '',
              image: ImageURL(secureUrl: AppConstants.dummyIngredientImage),
            ),
          ),
          OrderIngredientModel(
            orderIngredientId: '',
            quantity: 0,
            price: 0,
            ingredientData: IngredientDataModel(
              id: '',
              stock: 0,
              appliedPrice: 0,
              averageRating: 0,
              basePrice: 0,
              description: '',
              discount: Discount(amount: 0, type: ''),
              inCart: false,
              name: '',
              image: ImageURL(secureUrl: AppConstants.dummyIngredientImage),
            ),
          ),
        ],
      ),
    );

    return Skeletonizer(
      containersColor: AppColors.white,
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrdersListItem(orderModel: orders[index]);
        },
      ),
    );
  }
}
