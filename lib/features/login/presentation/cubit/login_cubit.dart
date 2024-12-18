import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/login/data/models/login_request_model.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(const LoginState.loading());
    final result = await _loginRepo.login(
      requestModel: LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (successResponse) => emit(
        LoginState.success(successResponse.message),
      ),
      failure: (failureResponse) => emit(
        LoginState.error(failureResponse.errMessages),
      ),
    );
  }
}
