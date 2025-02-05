import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/my_profile/presentation/cubit/delete_user_image/delete_user_image_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/Delete_image_dialog.dart';

class UserImageCircleAvatar extends StatelessWidget {
  const UserImageCircleAvatar({
    super.key,
    required this.userImage,
  });

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showDeleteProfileImageDailog(context);
      },
      child: CircleAvatar(
        radius: 43.r,
        backgroundColor: AppColors.primaryDarker,
        child: CircleAvatar(
          radius: 40.r,
          backgroundColor: AppColors.white,
          backgroundImage: userImage != null
              ? NetworkImage(
                  userImage!,
                )
              : NetworkImage(
                  defaultUserImage,
                ),
        ),
      ),
    );
  }

  Future<dynamic> showDeleteProfileImageDailog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => getIt<DeleteUserImageCubit>(),
            child: const DeleteImageAlertDialog(),
          );
        }).whenComplete(() async {
      if (context.mounted) {
        context.read<GetUserProfileCubit>().getUserProfile();
      }
    });
  }
}
