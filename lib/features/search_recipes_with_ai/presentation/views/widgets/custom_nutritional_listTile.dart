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
      trailing: Flexible(
        child: Text(
          extractValueWithUnit(trailing),
          style: AppStyles.smallRegularPrimaryDarkerText,
        ),
      ),
    );
  }

  String extractValueWithUnit(String? input) {
    if (input == null || input.isEmpty) return '';
    final cleanedText = input
        .replaceFirst("Approximately ", "")
        .replaceAll(RegExp(r'[^0-9.kcalg\s]'), '')
        .trim();
    final match = RegExp(r'(\d+\.?\d*)\s*(g|kcal)').firstMatch(cleanedText);

    return match != null ? '${match.group(1)} ${match.group(2)}' : '';
  }
}
