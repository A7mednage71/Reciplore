// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_and_update_address_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAndUpdateAddressRequestModel _$AddAndUpdateAddressRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddAndUpdateAddressRequestModel(
      addressLabel: json['addressLabel'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      postalCode: (json['postalCode'] as num).toInt(),
      buildingNumber: json['buildingNumber'] as String,
      floorNumber: (json['floorNumber'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddAndUpdateAddressRequestModelToJson(
        AddAndUpdateAddressRequestModel instance) =>
    <String, dynamic>{
      'addressLabel': instance.addressLabel,
      'country': instance.country,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'buildingNumber': instance.buildingNumber,
      'floorNumber': instance.floorNumber,
      'notes': instance.notes,
    };
