import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';

class LikeAndDislike extends StatelessWidget {
  const LikeAndDislike({
    super.key,
    required this.like,
    required this.dislike,
  });
  final int like;
  final int dislike;
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
          '$like',
          style: AppStyles.smallRegularText.copyWith(color: AppColors.grayDark),
        ),
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.thumb_down_alt_outlined),
        ),
        Text('$dislike',
            style:
                AppStyles.smallRegularText.copyWith(color: AppColors.grayDark)),
      ],
    );
  }
}
