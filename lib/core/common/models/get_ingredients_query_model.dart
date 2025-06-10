import 'package:json_annotation/json_annotation.dart';

part 'get_ingredients_query_model.g.dart';

@JsonSerializable()
class GetIngredientsQueryModel {
  final int? page;
  final int? limit;
  final String? search;
  final String? sort;
  @JsonKey(name: 'Average_rating[gte]')
  final String? rate;
  @JsonKey(name: 'appliedPrice[lte]')
  final String? maxPrice;
  @JsonKey(name: 'appliedPrice[gte]')
  final String? minPrice;

  GetIngredientsQueryModel({
    this.page,
    this.limit,
    this.search,
    this.sort,
    this.rate = '0',
    this.maxPrice = '100',
    this.minPrice = '0',
  });

  factory GetIngredientsQueryModel.fromJson(Map<String, dynamic> json) =>
      _$GetIngredientsQueryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetIngredientsQueryModelToJson(this);
}
