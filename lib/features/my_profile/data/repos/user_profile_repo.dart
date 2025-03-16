import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:looqma/core/networking/api_error.dart';
import 'package:looqma/core/networking/api_result.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/my_profile/data/models/delete_profile_image_model.dart';
import 'package:looqma/features/my_profile/data/models/update_user_info_request_model.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';

class UserProfileRepo {
  UserProfileRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<UserProfileResponseModel>> getUserProfile() async {
    try {
      final result = await _apiService.getUserProfile();
      return ApiResult.success(result);
    } catch (e) {
      log("Error: $e");
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ApiError(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> uploadProfileImage(
      {required XFile file}) async {
    try {
      // convert image to formdata
      final formdata = await convertImageToFormData(file);
      // upload it to the server
      final result = await _apiService.uploadUserImage(formdata);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<FormData> convertImageToFormData(XFile file) async {
    final formdata = FormData();
    formdata.files.add(MapEntry(
        'profileImg',
        await MultipartFile.fromFile(file.path,
            contentType: DioMediaType('image', file.path.split('.').last))));
    return formdata;
  }

  Future<ApiResult<DeleteProfileImageModel>> deleteProfileImage() async {
    try {
      final result = await _apiService.deleteUserImage();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<ResponseMessageModel>> updateUserInfo(
      {required UpdateUserInfoRequestModel body}) async {
    try {
      final result = await _apiService.updateUserInfo(body);
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ServerFailure.fromDioError(e));
      }
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
