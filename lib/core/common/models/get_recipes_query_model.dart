import 'package:json_annotation/json_annotation.dart';

part 'get_recipes_query_model.g.dart';

@JsonSerializable()
class GetRecipesQueryModel {
  final int? page;
  final int? limit;
  final String? country;
  final String? category;
  final String? search;
  @JsonKey(name: 'Average_rating[gte]')
  final String rate;
  final String? sort;

  GetRecipesQueryModel({
    required this.page,
    this.limit,
    this.country,
    this.category,
    this.search,
    this.rate = "0",
    this.sort,
  });

  factory GetRecipesQueryModel.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesQueryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecipesQueryModelToJson(this);
}
