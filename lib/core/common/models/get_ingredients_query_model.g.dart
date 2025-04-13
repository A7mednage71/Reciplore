// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ingredients_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIngredientsQueryModel _$GetIngredientsQueryModelFromJson(
        Map<String, dynamic> json) =>
    GetIngredientsQueryModel(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      search: json['search'] as String?,
      sort: json['sort'] as String?,
      rate: json['Average_rating[gte]'] as String? ?? '0',
      maxPrice: json['appliedPrice[lte]'] as String? ?? '100',
      minPrice: json['appliedPrice[gte]'] as String? ?? '0',
    );

Map<String, dynamic> _$GetIngredientsQueryModelToJson(
        GetIngredientsQueryModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'search': instance.search,
      'sort': instance.sort,
      'Average_rating[gte]': instance.rate,
      'appliedPrice[lte]': instance.maxPrice,
      'appliedPrice[gte]': instance.minPrice,
    };
