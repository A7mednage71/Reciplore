import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';

part 'verification_cubit.freezed.dart';
part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this._repo) : super(const VerificationState.initial());

  final VerficationRepo _repo;

  Future<void> verifyOtp(
      {required VerifyRequestModel verifyRequestModel}) async {
    emit(const VerificationState.loading());
    final result =
        await _repo.verifyLogin(verifyRequestModel: verifyRequestModel);

    result.when(
      success: (successResponse) => emit(
        VerificationState.success(successResponse.message),
      ),
      failure: (failureResponse) =>
          emit(VerificationState.failure(failureResponse.errMessages)),
    );
  }
}
