import 'package:json_annotation/json_annotation.dart';

part 'add_and_update_address_request_model.g.dart';

@JsonSerializable()
class AddAndUpdateAddressRequestModel {
  final String addressLabel;
  final String streetName;
  final String country;
  final String city;
  final int postalCode;
  final String buildingNumber;
  final int? floorNumber;
  final String? notes;

  AddAndUpdateAddressRequestModel({
    required this.addressLabel,
    required this.streetName,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.buildingNumber,
    this.floorNumber,
    this.notes,
  });

  factory AddAndUpdateAddressRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddAndUpdateAddressRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddAndUpdateAddressRequestModelToJson(this);
}
