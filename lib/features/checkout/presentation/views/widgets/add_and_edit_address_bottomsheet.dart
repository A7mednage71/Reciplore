import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';

class AddAndEditAddressBottomSheet extends StatefulWidget {
  const AddAndEditAddressBottomSheet({super.key, this.isEdit = false});
  final bool isEdit;
  @override
  State<AddAndEditAddressBottomSheet> createState() =>
      _AddAndEditAddressBottomSheetState();
}

class _AddAndEditAddressBottomSheetState
    extends State<AddAndEditAddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController addressController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController postalCodeController;
  late TextEditingController buildingController;
  late TextEditingController floorController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    postalCodeController = TextEditingController();
    buildingController = TextEditingController();
    floorController = TextEditingController();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    addressController.dispose();
    countryController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    buildingController.dispose();
    floorController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.isEdit ? 'Edit Address' : 'Add Address',
                style: AppStyles.mediumBoldText,
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: addressController,
                validator: MyValidators.requiredValidator,
                keyboardType: TextInputType.text,
                hintText: "Address label",
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: countryController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.text,
                      hintText: "Country",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      controller: cityController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.text,
                      hintText: "City",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: postalCodeController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.number,
                      hintText: "postal code",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      controller: buildingController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.number,
                      hintText: "building No",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: floorController,
                validator: MyValidators.requiredValidator,
                keyboardType: TextInputType.text,
                hintText: "Floor No",
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: notesController,
                validator: MyValidators.requiredValidator,
                keyboardType: TextInputType.text,
                hintText: "Notes",
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: AppStyles.smallBoldText,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          widget.isEdit ? "Edit" : "Add",
                          style: AppStyles.smallBoldWhiteText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
