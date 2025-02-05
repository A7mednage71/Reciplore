import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/change_password/data/models/change_password_request_model.dart';
import 'package:looqma/features/change_password/data/repos/change_password_repo.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordRepo)
      : super(const ChangePasswordState.initial());
  final ChangePasswordRepo _changePasswordRepo;

  Future<void> changePassword(
      {required ChangePasswordRequestModel requestModel}) async {
    emit(const ChangePasswordState.loading());

    final result =
        await _changePasswordRepo.changePassword(requestModel: requestModel);

    result.when(
      success: (successResponse) => emit(
        ChangePasswordState.success(message: successResponse.message),
      ),
      failure: (failureResponse) => emit(
        ChangePasswordState.failure(errMessage: failureResponse.errMessages),
      ),
    );
  }
}
