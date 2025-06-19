import 'package:json_annotation/json_annotation.dart';

part 'place_order_response_model.g.dart';

@JsonSerializable()
class PlaceOrderResponseModel {
  final String message;
  final PlacedOrderModel order;

  PlaceOrderResponseModel({required this.order, required this.message});

  factory PlaceOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderResponseModelToJson(this);
}

@JsonSerializable()
class PlacedOrderModel {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final double subTotal;
  final int total;
  final bool fromCart;
  final String paymentMethod;
  final String orderStatus;
  final String orderedAt;

  PlacedOrderModel({
    required this.id,
    required this.userId,
    required this.subTotal,
    required this.total,
    required this.fromCart,
    required this.paymentMethod,
    required this.orderStatus,
    required this.orderedAt,
  });

  factory PlacedOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PlacedOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacedOrderModelToJson(this);
}
