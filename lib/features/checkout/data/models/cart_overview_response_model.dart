import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/features/checkout/data/models/address_model.dart';

part 'cart_overview_response_model.g.dart';

@JsonSerializable()
class CartOverviewResponseModel {
  final String? couponId;
  final int shippingFee;
  final int vatAmount;
  final int coupondiscount;
  final int subTotal;
  final int total;
  List<AddressModel> addresses;
  CartOverviewResponseModel({
    this.couponId,
    required this.shippingFee,
    required this.vatAmount,
    required this.coupondiscount,
    required this.subTotal,
    required this.total,
    required this.addresses,
  });

  factory CartOverviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartOverviewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartOverviewResponseModelToJson(this);

  CartOverviewResponseModel copyWith({
    String? couponId,
    int? shippingFee,
    int? vatAmount,
    int? coupondiscount,
    int? subTotal,
    int? total,
    List<AddressModel>? addresses,
  }) {
    return CartOverviewResponseModel(
      couponId: couponId ?? this.couponId,
      shippingFee: shippingFee ?? this.shippingFee,
      vatAmount: vatAmount ?? this.vatAmount,
      coupondiscount: coupondiscount ?? this.coupondiscount,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      addresses: addresses ?? this.addresses,
    );
  }
}
