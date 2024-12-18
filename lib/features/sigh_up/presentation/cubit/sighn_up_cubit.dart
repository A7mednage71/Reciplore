import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/sigh_up/data/models/sign_up_request_model.dart';
import 'package:looqma/features/sigh_up/data/repos/sighn_up_repo.dart';

part 'sighn_up_cubit.freezed.dart';
part 'sighn_up_state.dart';

class SighnUpCubit extends Cubit<SighnUpState> {
  SighnUpCubit(this._sighnUpRepo) : super(const SighnUpState.initial());

  final SighnUpRepo _sighnUpRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    emit(const SighnUpState.loading());

    final result = await _sighnUpRepo.signUp(
      body: SignUpRequestModel(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          phoneNumbers: [phoneController.text.trim()],
          confirmPassword: confirmPasswordController.text.trim()),
    );

    result.when(
      success: (successResponse) {
        emit(SighnUpState.success(successResponse.message));
      },
      failure: (failureResponse) =>
          emit(SighnUpState.failure(failureResponse.errMessages)),
    );
  }
}
