import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/join_community.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/logout_button.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/profile_listtile_item.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/my_profile/show_user_data_blocbuilder.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final getUserProfileCubit = context.read<GetUserProfileCubit>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: RefreshIndicator(
          color: AppColors.primaryDarker,
          onRefresh: () async {
            await getUserProfileCubit.getUserProfile();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Profile',
                    style: AppStyles.largeBoldText,
                  ),
                ),
                SizedBox(height: 20.h),
                const ShowUserDataBlocBuilder(),
                SizedBox(height: 20.h),
                ProfileListTileItem(
                  title: "Update Info",
                  icon: IconlyLight.edit_square,
                  onTap: () async {
                    await updateUserInfo(getUserProfileCubit, context);
                  },
                ),
                ProfileListTileItem(
                  title: "Change Password",
                  icon: Icons.lock_outline,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.changePassword);
                  },
                ),
                ProfileListTileItem(
                  title: "About",
                  icon: Icons.info_outline_rounded,
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                const LogoutButton(),
                SizedBox(height: 10.h),
                const JoinCommunityWidget(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateUserInfo(
      GetUserProfileCubit getUserProfileCubit, BuildContext context) async {
    final userProfile = getUserProfileCubit.userProfile;
    if (userProfile != null) {
      final result = await Navigator.of(context, rootNavigator: true)
          .pushNamed(Routes.updateProfileInfo, arguments: userProfile);
      if (result == true) {
        getUserProfileCubit.getUserProfile();
      }
    } else {
      ShowToast.showFailureToast('waiting for fetch user profile');
    }
  }
}
