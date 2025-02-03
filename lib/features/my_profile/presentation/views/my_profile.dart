import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/join_community.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/logout_button.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/profile_listtile_item.dart';
import 'package:looqma/features/my_profile/presentation/views/widgets/show_user_data_blocbuilder.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetUserProfileCubit>()..getUserProfile(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
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
              SizedBox(height: 40.h),
              ProfileListTileItem(
                title: "Change Password",
                icon: Icons.lock_outline,
                onTap: () {},
              ),
              ProfileListTileItem(
                title: "About",
                icon: Icons.info_outline_rounded,
                onTap: () {},
              ),
              SizedBox(height: 20.h),
              const LogoutButton(),
              const Spacer(),
              const JoinCommunityWidget(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
