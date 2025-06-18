import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/common/widgets/cached_network_circle_avatar.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/my_profile/presentation/cubit/delete_user_image/delete_user_image_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/Delete_image_dialog.dart';

class UserImageCircleAvatar extends StatelessWidget {
  const UserImageCircleAvatar({
    super.key,
    required this.userImage,
  });

  final String? userImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserImageCubit, DeleteUserImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (successMessage) {
            ShowToast.showSuccessToast(successMessage);
            context.read<GetUserProfileCubit>().getUserProfile();
          },
          failure: (failureMessage) {
            ShowToast.showFailureToast(failureMessage);
          },
        );
      },
      child: GestureDetector(
        onDoubleTap: () {
          showDeleteProfileImageDailog(context);
        },
        child: CircleAvatar(
          radius: 43.r,
          backgroundColor: AppColors.primaryDarker,
          child: CachedNetworkCircleAvatar(
            radius: 40.r,
            image: userImage != null ? userImage! : defaultUserImage,
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDeleteProfileImageDailog(BuildContext context) {
    final cubit = context.read<DeleteUserImageCubit>();
    return showDialog(
        context: context,
        builder: (context) {
          return BlocProvider.value(
            value: cubit,
            child: const DeleteImageAlertDialog(),
          );
        });
  }
}
