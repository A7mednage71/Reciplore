// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipesRequest _$GetRecipesRequestFromJson(Map<String, dynamic> json) =>
    GetRecipesRequest(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      country: json['country'] as String?,
      category: json['category'] as String?,
      search: json['search'] as String?,
    );

Map<String, dynamic> _$GetRecipesRequestToJson(GetRecipesRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'country': instance.country,
      'category': instance.category,
      'search': instance.search,
    };
