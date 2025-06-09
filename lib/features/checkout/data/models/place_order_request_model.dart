import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_model.g.dart';

@JsonSerializable()
class PlaceOrderRequestModel {
  final String shippingAddressID;
  final String contactNumber;
  final String paymentMethod;
  final String? couponCode;

  PlaceOrderRequestModel({
    required this.shippingAddressID,
    required this.contactNumber,
    required this.paymentMethod,
    required this.couponCode,
  });

  factory PlaceOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderRequestModelToJson(this);
}
