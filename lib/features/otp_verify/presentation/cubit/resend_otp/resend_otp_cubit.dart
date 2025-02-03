import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/otp_verify/data/models/resend_otp_request_model.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';

part 'resend_otp_cubit.freezed.dart';
part 'resend_otp_state.dart';

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit(this._repo) : super(const ResendOtpState.initial());

  final VerficationRepo _repo;

  String email = '';

  Future<void> resendOtp() async {
    emit(const ResendOtpState.loading());

    final result = await _repo.resendOtp(
        resendOtpRequestModel: ResendOtpRequestModel(
      email: email,
    ));
    result.when(
      success: (successResponse) =>
          emit(ResendOtpState.success(successResponse.message)),
      failure: (failureResponse) =>
          emit(ResendOtpState.failure(failureResponse.errMessages)),
    );
  }
}
