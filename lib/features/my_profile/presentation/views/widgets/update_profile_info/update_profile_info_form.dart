import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/presentation/cubit/update_user_profile/update_user_profile_cubit.dart';

class UpdateProfileInfoForm extends StatefulWidget {
  const UpdateProfileInfoForm({
    super.key,
    this.userProfile,
  });
  final UserProfileResponseModel? userProfile;

  @override
  State<UpdateProfileInfoForm> createState() => _UpdateProfileInfoFormState();
}

class _UpdateProfileInfoFormState extends State<UpdateProfileInfoForm> {
  @override
  void initState() {
    context.read<UpdateUserProfileCubit>().setInitialData(widget.userProfile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateUserCubit = context.read<UpdateUserProfileCubit>();
    return Form(
        key: updateUserCubit.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: AppStyles.smallRegularText),
            SizedBox(height: 5.h),
            CustomTextField(
              controller: updateUserCubit.nameController,
              validator: MyValidators.displayNamevalidator,
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter Your Name",
            ),
            SizedBox(height: 15.h),
            Text("Phone Number", style: AppStyles.smallRegularText),
            SizedBox(height: 5.h),
            CustomTextField(
              controller: updateUserCubit.phoneController,
              validator: MyValidators.phoneNumberValidator,
              keyboardType: TextInputType.phone,
              hintText: "Enter Your Phone Number",
            ),
            SizedBox(height: 15.h),
            Text("Age", style: AppStyles.smallRegularText),
            SizedBox(height: 5.h),
            CustomTextField(
              controller: updateUserCubit.ageController,
              validator: MyValidators.ageValidator,
              keyboardType: TextInputType.number,
              hintText: "Enter Your age",
            ),
            SizedBox(height: 15.h),
          ],
        ));
  }
}
