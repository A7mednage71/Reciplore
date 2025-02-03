import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/show_user_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowUserDataBlocBuilder extends StatelessWidget {
  const ShowUserDataBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const SizedBox.shrink();
          },
          loading: () {
            return const Skeletonizer(child: ShowUserData());
          },
          success: (successResponse) {
            return ShowUserData(userProfileModel: successResponse);
          },
          failure: () {
            return FailureState(hight: 50.h);
          },
        );
      },
    );
  }
}
