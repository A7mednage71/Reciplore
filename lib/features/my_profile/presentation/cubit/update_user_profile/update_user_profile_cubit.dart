import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/core/services/notifiers/user_data_notifier.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/features/my_profile/data/models/update_user_info_request_model.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/data/repos/user_profile_repo.dart';

part 'update_user_profile_cubit.freezed.dart';
part 'update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit(this._profileRepo)
      : super(const UpdateUserProfileState.initial());

  final UserProfileRepo _profileRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> updateUserProfile() async {
    emit(const UpdateUserProfileState.loading());

    final result = await _profileRepo.updateUserInfo(
      body: UpdateUserInfoRequestModel(
        name: nameController.text.trim(),
        phoneNumbers: [
          phoneController.text.trim(),
        ],
        age: int.parse(ageController.text.trim()),
        addresses: [addressController.text.trim()],
      ),
    );

    result.when(
      success: (successResponse) async {
        await SecureStorage.setSecuredData(
            SecureStorageKeys.userName, nameController.text.trim());
        UserDataNotifier.userNameNotifier.value = nameController.text.trim();
        emit(UpdateUserProfileState.success(message: successResponse.message));
      },
      failure: (failureResponse) {
        emit(UpdateUserProfileState.failure(
            message: failureResponse.errMessages));
      },
    );
  }

  void setInitialData(UserProfileResponseModel? userProfile) {
    nameController.text = userProfile!.userName;
    phoneController.text = userProfile.phoneNumbers.first;
    ageController.text =
        userProfile.userAge == null ? '' : userProfile.userAge.toString();
    addressController.text = userProfile.userAddresses.isNotEmpty
        ? userProfile.userAddresses.first
        : '';
  }
}
