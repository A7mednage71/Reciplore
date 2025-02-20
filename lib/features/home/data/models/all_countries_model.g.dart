// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCountriesModel _$AllCountriesModelFromJson(Map<String, dynamic> json) =>
    AllCountriesModel(
      countries: (json['countries'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCountriesModelToJson(AllCountriesModel instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      countryId: json['_id'] as String,
      countryName: json['name'] as String,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      '_id': instance.countryId,
      'name': instance.countryName,
    };
