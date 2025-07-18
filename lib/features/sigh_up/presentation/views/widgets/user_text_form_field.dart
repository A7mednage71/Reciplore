import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';

class UserTextFormField extends StatelessWidget {
  const UserTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name", style: AppStyles.smallRegularText),
        SizedBox(height: 5.h),
        CustomTextField(
          controller: context.read<SighnUpCubit>().nameController,
          validator: MyValidators.displayNamevalidator,
          keyboardType: TextInputType.name,
          hintText: "Enter Name",
        ),
      ],
    );
  }
}
