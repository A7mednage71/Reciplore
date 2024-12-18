import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:looqma/features/forget_password/data/repos/forget_password_repo.dart';

part 'forget_password_cubit.freezed.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  final ForgetPasswordRepo _forgetPasswordRepo;

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    emit(const ForgetPasswordState.loading());
    final result = await _forgetPasswordRepo.forgetPassword(
        requestModel: ForgetPasswordRequestModel(email: emailController.text));

    result.when(
      success: (successResponse) => emit(
        ForgetPasswordState.success(successResponse.message),
      ),
      failure: (failureResponse) =>
          emit(ForgetPasswordState.failure(failureResponse.errMessages)),
    );
  }
}
