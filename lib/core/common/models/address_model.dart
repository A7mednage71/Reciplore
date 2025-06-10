import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final String addressLabel;
  final String streetName;
  final String country;
  final String city;
  final int postalCode;
  final String buildingNumber;
  final int? floorNumber;
  final String? notes;
  final bool isDefault;
  final String createdAt;

  AddressModel({
    required this.id,
    required this.userId,
    required this.addressLabel,
    required this.streetName,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.buildingNumber,
    this.floorNumber,
    this.notes,
    required this.isDefault,
    required this.createdAt,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  AddressModel copyWith({
    String? id,
    String? userId,
    String? addressLabel,
    String? streetName,
    String? country,
    String? city,
    int? postalCode,
    String? buildingNumber,
    int? floorNumber,
    String? notes,
    bool? isDefault,
    String? createdAt,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addressLabel: addressLabel ?? this.addressLabel,
      streetName: streetName ?? this.streetName,
      country: country ?? this.country,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
      notes: notes ?? this.notes,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
