import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/features/diet_plan/data/models/diet_plan_request_model.dart';
import 'package:looqma/features/diet_plan/data/repo/diet_plan_repo.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_state.dart';

enum Gender { male, female }

class DietPlanCubit extends Cubit<DietPlanState> {
  final DietPlanRepo _dietPlanRepo;

  DietPlanCubit(this._dietPlanRepo) : super(const DietPlanState());

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController fatController = TextEditingController();
  final TextEditingController preferencesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> createDietPlan() async {
    emit(state.copyWith(status: DietPlanStatus.loading));

    final response = await _dietPlanRepo.recommendationByDietPlan(
        DietPlanRequestModel(
            height: double.parse(heightController.text.trim()),
            weight: double.parse(weightController.text.trim()),
            age: double.parse(ageController.text.trim()),
            fatPercentage: double.parse(fatController.text.trim()),
            preferences: preferencesController.text.trim(),
            gender: state.gender!,
            goal: state.goal!));

    response.when(
      success: (data) {
        emit(state.copyWith(
          status: DietPlanStatus.success,
          message: data.message,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
          status: DietPlanStatus.failure,
          message: error.errMessages,
        ));
      },
    );
  }

  void changeGender(Gender gender) {
    if (gender == Gender.male) {
      emit(state.copyWith(gender: 'male'));
    } else {
      emit(state.copyWith(gender: 'female'));
    }
  }

  void changeGoal(String goal) {
    emit(state.copyWith(goal: goal));
  }
}
