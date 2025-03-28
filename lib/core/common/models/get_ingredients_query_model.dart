import 'package:json_annotation/json_annotation.dart';

part 'get_ingredients_query_model.g.dart';

@JsonSerializable()
class GetIngredientsQueryModel {
  final int? page;
  final int? limit;
  final String? search;
  final String? sort;

  GetIngredientsQueryModel({
    required this.page,
    required this.limit,
    required this.search,
    required this.sort,
  });

  factory GetIngredientsQueryModel.fromJson(Map<String, dynamic> json) =>
      _$GetIngredientsQueryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetIngredientsQueryModelToJson(this);
}
