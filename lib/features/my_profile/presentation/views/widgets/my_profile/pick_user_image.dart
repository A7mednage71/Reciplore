import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/upload_user_image/upload_user_image_cubit.dart';

class PickUserImage extends StatelessWidget {
  const PickUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadUserImageCubit, UploadUserImageState>(
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
    }, builder: (context, state) {
      return state.maybeWhen(
        loading: () {
          return Container(
            width: 25.w,
            height: 25.w,
            decoration: BoxDecoration(
              color: AppColors.primaryMedium,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        },
        orElse: () {
          return InkWell(
            onTap: () async {
              await context.read<UploadUserImageCubit>().uploadImage();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 25.w,
              height: 25.w,
              decoration: BoxDecoration(
                color: AppColors.primaryMedium,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: const Icon(IconlyLight.camera, color: AppColors.white),
            ),
          );
        },
      );
    });
  }
}
