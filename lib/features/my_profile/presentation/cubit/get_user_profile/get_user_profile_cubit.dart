import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/data/repos/user_profile_repo.dart';

part 'get_user_profile_cubit.freezed.dart';
part 'get_user_profile_state.dart';

class GetUserProfileCubit extends Cubit<GetUserProfileState> {
  GetUserProfileCubit(this._userProfileRepo)
      : super(const GetUserProfileState.initial());
  final UserProfileRepo _userProfileRepo;

  Future<void> getUserProfile() async {
    emit(const GetUserProfileState.loading());
    final result = await _userProfileRepo.getUserProfile();

    result.when(
      success: (successResponse) =>
          emit(GetUserProfileState.success(successResponse)),
      failure: (failureResponse) => emit(const GetUserProfileState.failure()),
    );
  }
}
