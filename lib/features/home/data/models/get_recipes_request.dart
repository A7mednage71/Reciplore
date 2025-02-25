import 'package:json_annotation/json_annotation.dart';

part 'get_recipes_request.g.dart';

@JsonSerializable()
class GetRecipesRequest {
  final int? page;
  final int? limit;
  final String? country;
  final String? category;
  final String? search;
  @JsonKey(name: 'Average_rating[gte]')
  final String rate;

  GetRecipesRequest({
    required this.page,
    this.limit,
    this.country,
    this.category,
    this.search,
    this.rate = "0",
  });

  factory GetRecipesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecipesRequestToJson(this);
}
