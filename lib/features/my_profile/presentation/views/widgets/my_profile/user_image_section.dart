import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/features/my_profile/presentation/cubit/upload_user_image/upload_user_image_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/pick_user_image.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/user_image_circle_avatar.dart';

class UserImageSection extends StatelessWidget {
  const UserImageSection({
    super.key,
    required this.userImage,
  });
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserImageCircleAvatar(userImage: userImage),
        Positioned(
          right: 0,
          bottom: 0,
          child: BlocProvider(
            create: (context) => getIt<UploadUserImageCubit>(),
            child: const PickUserImage(),
          ),
        ),
      ],
    );
  }
}
