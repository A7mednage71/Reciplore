import 'package:json_annotation/json_annotation.dart';

part 'diet_plan_request_model.g.dart';

@JsonSerializable()
class DietPlanRequestModel {
  final double height;
  final double weight;
  final double fatPercentage;
  final double age;
  final String goal;
  final String preferences;
  final String gender;

  DietPlanRequestModel({
    required this.height,
    required this.weight,
    required this.fatPercentage,
    required this.age,
    required this.goal,
    required this.preferences,
    required this.gender,
  });

  factory DietPlanRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DietPlanRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$DietPlanRequestModelToJson(this);
}
