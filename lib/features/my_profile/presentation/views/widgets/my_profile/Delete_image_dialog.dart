import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/cubit/delete_user_image/delete_user_image_cubit.dart';
import 'package:lottie/lottie.dart';

class DeleteImageAlertDialog extends StatelessWidget {
  const DeleteImageAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          'Delete Image',
          style: AppStyles.mediumBoldText,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AppAssets.imagesWorningLottie,
              height: 100.h,
            ),
            Text('Are you sure you want to delete your image?',
                style: AppStyles.smallRegularText),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: AppStyles.extraSmallBoldprimaryDarkerText,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Delete',
              style: AppStyles.extraSmallBoldWarningText,
            ),
            onPressed: () async {
              await context.read<DeleteUserImageCubit>().deleteImage();
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          )
        ]);
  }
}
