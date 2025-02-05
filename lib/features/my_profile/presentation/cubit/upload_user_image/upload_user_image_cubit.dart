import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:looqma/features/my_profile/data/repos/user_profile_repo.dart';

part 'upload_user_image_cubit.freezed.dart';
part 'upload_user_image_state.dart';

class UploadUserImageCubit extends Cubit<UploadUserImageState> {
  UploadUserImageCubit(this.uploadImageRepo)
      : super(const UploadUserImageState.initial());

  final UserProfileRepo uploadImageRepo;

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    // pick the image
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;
    // upload the image
    emit(const UploadUserImageState.loading());
    final result = await uploadImageRepo.uploadProfileImage(file: image);

    result.when(
      success: (data) {
        emit(UploadUserImageState.success(successMessage: data.message));
      },
      failure: (failure) {
        emit(UploadUserImageState.failure(errMessage: failure.errMessages));
      },
    );
  }
}
