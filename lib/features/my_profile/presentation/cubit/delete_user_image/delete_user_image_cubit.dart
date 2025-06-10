import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/my_profile/data/repos/user_profile_repo.dart';

part 'delete_user_image_cubit.freezed.dart';
part 'delete_user_image_state.dart';

class DeleteUserImageCubit extends Cubit<DeleteUserImageState> {
  DeleteUserImageCubit(this.uploadImageRepo)
      : super(const DeleteUserImageState.initial());

  final UserProfileRepo uploadImageRepo;

  Future<void> deleteImage() async {
    emit(const DeleteUserImageState.loading());

    final result = await uploadImageRepo.deleteProfileImage();

    result.when(
      success: (data) {
        emit(DeleteUserImageState.success(successMessage: data.message));
      },
      failure: (failure) {
        emit(DeleteUserImageState.failure(errMessage: failure.errMessages));
      },
    );
  }
}
