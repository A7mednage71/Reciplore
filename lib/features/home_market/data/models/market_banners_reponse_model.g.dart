// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_banners_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketBannersReponseModel _$MarketBannersReponseModelFromJson(
        Map<String, dynamic> json) =>
    MarketBannersReponseModel(
      banners:
          MarketBannersModel.fromJson(json['banners'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarketBannersReponseModelToJson(
        MarketBannersReponseModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
    };

MarketBannersModel _$MarketBannersModelFromJson(Map<String, dynamic> json) =>
    MarketBannersModel(
      id: json['_id'] as String,
      section: json['section'] as String,
      images: (json['Images'] as List<dynamic>)
          .map((e) => ImageURL.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketBannersModelToJson(MarketBannersModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'section': instance.section,
      'Images': instance.images,
    };
