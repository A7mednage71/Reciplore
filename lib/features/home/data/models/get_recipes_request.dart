import 'package:json_annotation/json_annotation.dart';

part 'get_recipes_request.g.dart';

@JsonSerializable()
class GetRecipesRequest {
  final int? page;
  final int? limit;
  @JsonKey(name: 'countryID')
  final String? countryId;
  @JsonKey(name: 'categoryID')
  final String? categoryId;

  GetRecipesRequest({
    required this.page,
    this.limit,
    this.categoryId,
    this.countryId,
  });

  factory GetRecipesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRecipesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecipesRequestToJson(this);
}
