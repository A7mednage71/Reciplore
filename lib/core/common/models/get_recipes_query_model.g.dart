// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipes_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipesQueryModel _$GetRecipesQueryModelFromJson(
        Map<String, dynamic> json) =>
    GetRecipesQueryModel(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      country: json['country'] as String?,
      category: json['category'] as String?,
      search: json['search'] as String?,
      rate: json['Average_rating[gte]'] as String? ?? "0",
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$GetRecipesQueryModelToJson(
        GetRecipesQueryModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'country': instance.country,
      'category': instance.category,
      'search': instance.search,
      'Average_rating[gte]': instance.rate,
      'sort': instance.sort,
    };
