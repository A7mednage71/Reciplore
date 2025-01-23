import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_styles.dart';

class SearchResultLength extends StatelessWidget {
  const SearchResultLength({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Search Result',
          style: AppStyles.mediumBoldText,
        ),
        const Spacer(),
        Text(
          '255 results',
          style: AppStyles.extraSmallRegularText.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
