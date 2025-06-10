import 'package:json_annotation/json_annotation.dart';

part 'search_recipe_with_ai_request_model.g.dart';

@JsonSerializable()
class SearchRecipeWithAiRequestModel {
  final String ingredients;
  final int start;
  final int count;

  SearchRecipeWithAiRequestModel({
    required this.ingredients,
    required this.start,
    required this.count,
  });

  factory SearchRecipeWithAiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRecipeWithAiRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchRecipeWithAiRequestModelToJson(this);
}
