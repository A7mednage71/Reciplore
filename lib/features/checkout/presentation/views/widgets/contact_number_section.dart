import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';

class ContactNumberSection extends StatelessWidget {
  const ContactNumberSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Text("Contact Number", style: AppStyles.smallBoldText),
        SizedBox(height: 5.h),
        Form(
          key: context.read<CheckoutCubit>().contactNumberFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: CustomTextField(
            controller: context.read<CheckoutCubit>().contactNumberController,
            validator: MyValidators.phoneNumberValidator,
            keyboardType: TextInputType.number,
            hintText: "Enter Contact Number",
          ),
        ),
      ],
    );
  }
}
