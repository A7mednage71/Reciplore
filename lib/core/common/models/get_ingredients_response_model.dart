import 'package:json_annotation/json_annotation.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';

part 'get_ingredients_response_model.g.dart';

@JsonSerializable()
class GetIngredientsResponseModel {
  final FetchedIngredients ingredients;

  GetIngredientsResponseModel({required this.ingredients});

  factory GetIngredientsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetIngredientsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetIngredientsResponseModelToJson(this);
}

@JsonSerializable()
class FetchedIngredients {
  @JsonKey(name: 'docs')
  final List<IngredientDataModel> ingredientsList;
  final int limit;
  final int page;
  final int totalPages;
  final bool hasNextPage;
  @JsonKey(name: 'totalDocs')
  final int ingredientsCount;

  FetchedIngredients({
    required this.ingredientsList,
    required this.limit,
    required this.page,
    required this.totalPages,
    required this.hasNextPage,
    required this.ingredientsCount,
  });

  factory FetchedIngredients.fromJson(Map<String, dynamic> json) =>
      _$FetchedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$FetchedIngredientsToJson(this);
}
