// ignore: file_names
import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class CustomNutritionalListTile extends StatelessWidget {
  const CustomNutritionalListTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  final String? title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          width: 1,
          color: AppColors.grayLight,
        ),
      ),
      title: Text(title ?? "", style: AppStyles.smallBoldText),
      trailing:
          Text(trailing ?? "", style: AppStyles.smallRegularPrimaryDarkerText),
    );
  }
}
