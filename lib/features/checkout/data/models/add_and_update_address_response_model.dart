import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/features/checkout/data/models/address_model.dart';

part 'add_and_update_address_response_model.g.dart';

@JsonSerializable()
class AddAndUpdateAddressResponseModel {
  final String message;
  final AddressModel address;

  AddAndUpdateAddressResponseModel({
    required this.message,
    required this.address,
  });

  factory AddAndUpdateAddressResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$AddAndUpdateAddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddAndUpdateAddressResponseModelToJson(this);
}
