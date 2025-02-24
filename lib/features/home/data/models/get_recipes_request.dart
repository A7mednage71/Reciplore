import 'package:json_annotation/json_annotation.dart';

part 'get_recipes_request.g.dart';

@JsonSerializable()
class GetRecipesRequest {
  final int? page;
  final int? limit;
  final String? country;
  final String? category;
  final String? search;


  GetRecipesRequest({
    required this.page,
    this.limit,
    this.country,
    this.category,
    this.search,
  });

  factory GetRecipesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecipesRequestToJson(this);
}
