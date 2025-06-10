// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_plan_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DietPlanRequestModel _$DietPlanRequestModelFromJson(
        Map<String, dynamic> json) =>
    DietPlanRequestModel(
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      fatPercentage: (json['fatPercentage'] as num).toDouble(),
      age: (json['age'] as num).toDouble(),
      goal: json['goal'] as String,
      preferences: json['preferences'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$DietPlanRequestModelToJson(
        DietPlanRequestModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'fatPercentage': instance.fatPercentage,
      'age': instance.age,
      'goal': instance.goal,
      'preferences': instance.preferences,
      'gender': instance.gender,
    };
