import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/core/networking/dio_factory.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';

part 'verification_cubit.freezed.dart';
part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this._repo) : super(const VerificationState.initial());

  final VerficationRepo _repo;

  String otpCode = '';

  Future<void> verifyLogin() async {
    if (otpCode == '' || otpCode.length != 6) {
      emit(const VerificationState.failure('the code must be 6 digits!'));
      return;
    }
    emit(const VerificationState.loading());

    final result = await _repo.verifyLogin(
        verifyRequestModel: VerifyRequestModel(code: otpCode));
    result.when(
      success: (successResponse) {
        log('access token: ${ApiConstants.accessTokenPrefix}${successResponse.token}');

        SecureStorage.setSecuredData(SecureStorageKeys.accessToken,
            '${ApiConstants.accessTokenPrefix}${successResponse.token}');
        DioFactory.refreshHeaders(
            token: '${ApiConstants.accessTokenPrefix}${successResponse.token}');

        emit(VerificationState.success(successResponse.message));
      },
      failure: (failureResponse) =>
          emit(VerificationState.failure(failureResponse.errMessages)),
    );
  }
}
