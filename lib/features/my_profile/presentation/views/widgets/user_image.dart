import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/upload_user_image/upload_user_image_cubit.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.userImage,
  });
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadUserImageCubit, UploadUserImageState>(
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
      child: Stack(
        children: [
          CircleAvatar(
            radius: 43.r,
            backgroundColor: AppColors.primaryDarker,
            child: CircleAvatar(
              radius: 40.r,
              backgroundColor: AppColors.white,
              backgroundImage: userImage != null
                  ? NetworkImage(userImage!)
                  : const AssetImage(
                      AppAssets.imagesUserProfile,
                    ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () async {
                await context.read<UploadUserImageCubit>().uploadImage();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryMedium,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
