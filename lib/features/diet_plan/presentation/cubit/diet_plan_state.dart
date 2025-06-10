import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_plan_state.freezed.dart';

enum DietPlanStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class DietPlanState with _$DietPlanState {
  const factory DietPlanState({
    @Default(DietPlanStatus.initial) DietPlanStatus status,
    String? message,
    String? gender,
    String? goal,
  }) = _DietPlanState;
}
