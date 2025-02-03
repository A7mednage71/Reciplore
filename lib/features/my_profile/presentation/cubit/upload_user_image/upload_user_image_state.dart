part of 'upload_user_image_cubit.dart';

@freezed
class UploadUserImageState with _$UploadUserImageState {
  const factory UploadUserImageState.initial() = _Initial;
  const factory UploadUserImageState.loading() = _Loading;
  const factory UploadUserImageState.success({required String successMessage}) = _Success;
  const factory UploadUserImageState.failure({required String errMessage}) =
      _Failure;
}
