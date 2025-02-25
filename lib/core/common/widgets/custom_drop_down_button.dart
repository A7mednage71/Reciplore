import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  const CustomDropdownButtonFormField({
    required this.hint,
    this.vaidationText,
    required this.items,
    super.key,
    this.onChanged,
    this.chosenValue,
  });
  final String hint;
  final String? vaidationText;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? chosenValue;
  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(
        widget.hint,
        style: AppStyles.smallRegularText,
      ),
      value: value ?? widget.chosenValue,
      iconSize: 30.r,
      iconEnabledColor: AppColors.primaryDarker,
      style: AppStyles.smallBoldText,
      validator: (value) {
        if (value == null) {
          return widget.vaidationText;
        }
        return null;
      },
      menuMaxHeight: 300.h,
      iconDisabledColor: Colors.transparent,
      dropdownColor: AppColors.primaryLight,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: AppColors.grayLighter),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: AppColors.primaryDarker),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: widget.items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.white,
                  ),
                  child: Text(e)),
            ),
          )
          .toList(),
      selectedItemBuilder: (context) {
        return widget.items
            .map((e) =>
                Padding(padding: EdgeInsets.only(left: 10.w), child: Text(e)))
            .toList();
      },
      onChanged: widget.onChanged,
    );
  }
}
