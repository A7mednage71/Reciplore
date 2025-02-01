import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class LikeAndDislike extends StatelessWidget {
  const LikeAndDislike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.thumb_up_alt_rounded,
            color: AppColors.primaryDarker,
          ),
        ),
        Text(
          '9',
          style: AppStyles.smallRegularText.copyWith(color: AppColors.grayDark),
        ),
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.thumb_down_alt_outlined),
        ),
        Text('2',
            style:
                AppStyles.smallRegularText.copyWith(color: AppColors.grayDark)),
      ],
    );
  }
}
