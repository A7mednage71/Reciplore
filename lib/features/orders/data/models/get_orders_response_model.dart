import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'get_orders_response_model.g.dart';

@JsonSerializable()
class GetOrdersResponseModel {
  final List<OrderModel> orders;

  GetOrdersResponseModel({required this.orders});

  factory GetOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersResponseModelToJson(this);
}

@JsonSerializable()
class OrderModel {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final int subTotal;
  final int total;
  final String paymentMethod;
  final String orderStatus;
  final String shippingAddress;
  final String orderedAt;
  final String estimatedDeliveryDate;
  final List<OrderIngredientModel> orderIngredients;

  OrderModel({
    required this.id,
    required this.userId,
    required this.subTotal,
    required this.total,
    required this.paymentMethod,
    required this.orderStatus,
    required this.shippingAddress,
    required this.orderedAt,
    required this.estimatedDeliveryDate,
    required this.orderIngredients,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderIngredientModel {
  @JsonKey(name: '_id')
  final String orderIngredientId;
  final int quantity;
  final double price;
  @JsonKey(name: 'ingredientId')
  final IngredientDataModel ingredientData;

  OrderIngredientModel({
    required this.orderIngredientId,
    required this.quantity,
    required this.price,
    required this.ingredientData,
  });

  factory OrderIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$OrderIngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderIngredientModelToJson(this);
}
