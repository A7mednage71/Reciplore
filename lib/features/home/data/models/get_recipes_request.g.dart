// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipesRequest _$GetRecipesRequestFromJson(Map<String, dynamic> json) =>
    GetRecipesRequest(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      categoryId: json['categoryID'] as String?,
      countryId: json['countryID'] as String?,
    );

Map<String, dynamic> _$GetRecipesRequestToJson(GetRecipesRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'countryID': instance.countryId,
      'categoryID': instance.categoryId,
    };
