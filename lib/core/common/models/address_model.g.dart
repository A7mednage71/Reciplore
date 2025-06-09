// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      addressLabel: json['addressLabel'] as String,
      streetName: json['streetName'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      postalCode: (json['postalCode'] as num).toInt(),
      buildingNumber: json['buildingNumber'] as String,
      floorNumber: (json['floorNumber'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      isDefault: json['isDefault'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'addressLabel': instance.addressLabel,
      'streetName': instance.streetName,
      'country': instance.country,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'buildingNumber': instance.buildingNumber,
      'floorNumber': instance.floorNumber,
      'notes': instance.notes,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt,
    };
