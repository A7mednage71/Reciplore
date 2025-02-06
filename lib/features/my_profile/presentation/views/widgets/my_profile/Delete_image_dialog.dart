import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/cubit/delete_user_image/delete_user_image_cubit.dart';

class DeleteImageAlertDialog extends StatelessWidget {
  const DeleteImageAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Delete Image'),
        content: Text('Are you sure you want to delete your image?',
            style: AppStyles.smallRegularText),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: AppStyles.extraSmallBoldText
                  .copyWith(color: AppColors.primaryDarker),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Delete',
              style: AppStyles.extraSmallBoldText
                  .copyWith(color: AppColors.warningColor),
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
