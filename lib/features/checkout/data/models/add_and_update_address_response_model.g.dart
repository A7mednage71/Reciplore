// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_and_update_address_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAndUpdateAddressResponseModel _$AddAndUpdateAddressResponseModelFromJson(
        Map<String, dynamic> json) =>
    AddAndUpdateAddressResponseModel(
      message: json['message'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddAndUpdateAddressResponseModelToJson(
        AddAndUpdateAddressResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'address': instance.address,
    };
