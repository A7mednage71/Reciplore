import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/address_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'get_orders_response_model.g.dart';

@JsonSerializable()
class GetOrdersResponseModel {
  final List<OrderModel> orders;

  GetOrdersResponseModel({required this.orders});

  factory GetOrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrdersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrdersResponseModelToJson(this);

  GetOrdersResponseModel copyWith({
    List<OrderModel>? orders,
  }) {
    return GetOrdersResponseModel(
      orders: orders ?? this.orders,
    );
  }
}

@JsonSerializable()
class OrderModel {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final int subTotal;
  final int total;
  final int shippingFee;
  final int vat;
  final String paymentMethod;
  final String orderStatus;
  @JsonKey(name: 'shippingAddressID')
  final AddressModel deliveryAddress;
  final String orderedAt;
  final String estimatedDeliveryDate;
  final String contactNumber;
  final String? couponId;
  @JsonKey(name: 'items')
  final List<OrderIngredientModel> orderIngredients;

  OrderModel({
    required this.id,
    required this.userId,
    required this.subTotal,
    required this.total,
    required this.shippingFee,
    required this.vat,
    required this.paymentMethod,
    required this.orderStatus,
    required this.deliveryAddress,
    required this.orderedAt,
    required this.estimatedDeliveryDate,
    required this.contactNumber,
    required this.couponId,
    required this.orderIngredients,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel copyWith({
    String? id,
    String? userId,
    int? subTotal,
    int? total,
    int? shippingFee,
    int? vat,
    String? paymentMethod,
    String? orderStatus,
    AddressModel? deliveryAddress,
    String? orderedAt,
    String? estimatedDeliveryDate,
    String? contactNumber,
    String? couponId,
    List<OrderIngredientModel>? orderIngredients,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      shippingFee: shippingFee ?? this.shippingFee,
      vat: vat ?? this.vat,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      orderStatus: orderStatus ?? this.orderStatus,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      orderedAt: orderedAt ?? this.orderedAt,
      estimatedDeliveryDate:
          estimatedDeliveryDate ?? this.estimatedDeliveryDate,
      contactNumber: contactNumber ?? this.contactNumber,
      couponId: couponId ?? this.couponId,
      orderIngredients: orderIngredients ?? this.orderIngredients,
    );
  }
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
