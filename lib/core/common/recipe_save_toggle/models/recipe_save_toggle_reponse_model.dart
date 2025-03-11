import 'package:json_annotation/json_annotation.dart';

part 'recipe_save_toggle_reponse_model.g.dart';

@JsonSerializable()
class RecipeSaveToggleReponseModel {
  final String message;

  RecipeSaveToggleReponseModel({required this.message});

  factory RecipeSaveToggleReponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeSaveToggleReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeSaveToggleReponseModelToJson(this);
}
