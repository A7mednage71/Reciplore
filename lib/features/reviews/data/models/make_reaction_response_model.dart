import 'package:json_annotation/json_annotation.dart';

part 'make_reaction_response_model.g.dart';

@JsonSerializable()
class MakeReactionResponseModel {
  final int? likes;
  final int? dislikes;

  MakeReactionResponseModel({
    required this.likes,
    required this.dislikes,
  });

  factory MakeReactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MakeReactionResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MakeReactionResponseModelToJson(this);
}
