import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/checkout/data/models/add_and_update_address_request_model.dart';
import 'package:looqma/features/checkout/data/models/address_model.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';

class AddAndEditAddressBottomSheet extends StatefulWidget {
  const AddAndEditAddressBottomSheet(
      {super.key, this.isEdit = false, this.address});
  final bool isEdit;
  final AddressModel? address;

  @override
  State<AddAndEditAddressBottomSheet> createState() =>
      _AddAndEditAddressBottomSheetState();
}

class _AddAndEditAddressBottomSheetState
    extends State<AddAndEditAddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController addressController;
  late TextEditingController streetNameController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController postalCodeController;
  late TextEditingController buildingController;
  late TextEditingController floorController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    addressController =
        TextEditingController(text: widget.address?.addressLabel);
    streetNameController =
        TextEditingController(text: widget.address?.streetName);
    countryController = TextEditingController(text: widget.address?.country);
    cityController = TextEditingController(text: widget.address?.city);
    postalCodeController =
        TextEditingController(text: widget.address?.postalCode.toString());
    buildingController =
        TextEditingController(text: widget.address?.buildingNumber);
    floorController =
        TextEditingController(text: widget.address?.floorNumber.toString());
    notesController = TextEditingController(text: widget.address?.notes);
  }

  @override
  void dispose() {
    addressController.dispose();
    streetNameController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: streetNameController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.text,
                      hintText: "Street Name",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      controller: buildingController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.text,
                      hintText: "building No",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: floorController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.number,
                      hintText: "Floor No",
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      controller: postalCodeController,
                      validator: MyValidators.requiredValidator,
                      keyboardType: TextInputType.number,
                      hintText: "postal code",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                controller: notesController,
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
                  BlocConsumer<CheckoutCubit, CheckoutState>(
                    listenWhen: (previous, current) =>
                        previous.addressActionStatus !=
                        current.addressActionStatus,
                    listener: (context, state) {
                      if (state.addressActionStatus ==
                          AddressActionStatus.failure) {
                        ShowToast.showFailureToast(
                            state.addressActionMessage ?? '');
                      } else if (state.addressActionStatus ==
                          AddressActionStatus.success) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state.addressActionStatus ==
                          AddressActionStatus.loading) {
                        return Container(
                          height: 40.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: SpinKitFadingCircle(
                                color: AppColors.white, size: 20.r),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (widget.isEdit) {
                                await context
                                    .read<CheckoutCubit>()
                                    .updateAddress(
                                      id: widget.address!.id,
                                      addressModel:
                                          AddAndUpdateAddressRequestModel(
                                        addressLabel:
                                            addressController.text.trim(),
                                        streetName:
                                            streetNameController.text.trim(),
                                        country: countryController.text.trim(),
                                        city: cityController.text.trim(),
                                        postalCode: int.parse(
                                            postalCodeController.text),
                                        buildingNumber:
                                            buildingController.text.trim(),
                                        floorNumber: floorController
                                                .text.isNotEmpty
                                            ? int.parse(floorController.text)
                                            : null,
                                        notes: notesController.text.trim(),
                                      ),
                                    );
                              } else {
                                await context
                                    .read<CheckoutCubit>()
                                    .addNewAddress(
                                      addressModel:
                                          AddAndUpdateAddressRequestModel(
                                        addressLabel:
                                            addressController.text.trim(),
                                        streetName:
                                            streetNameController.text.trim(),
                                        country: countryController.text.trim(),
                                        city: cityController.text.trim(),
                                        postalCode: int.parse(
                                            postalCodeController.text),
                                        buildingNumber:
                                            buildingController.text.trim(),
                                        floorNumber: floorController
                                                .text.isNotEmpty
                                            ? int.parse(floorController.text)
                                            : null,
                                        notes: notesController.text.trim(),
                                      ),
                                    );
                              }
                            }
                          },
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
                        );
                      }
                    },
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
