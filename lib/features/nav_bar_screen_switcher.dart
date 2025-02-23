import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/chat_bot/presentation/views/chat_bot.dart';
import 'package:looqma/features/home/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_countries/get_countries_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/home/presentation/views/home_screen.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/screens/my_profile.dart';
import 'package:looqma/features/saved_recipe/presentation/views/saved_recipe_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarScreensSwitcher extends StatefulWidget {
  const NavBarScreensSwitcher({super.key});

  @override
  State<NavBarScreensSwitcher> createState() => _NavBarScreensSwitcherState();
}

class _NavBarScreensSwitcherState extends State<NavBarScreensSwitcher> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  List<Widget> myScreens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCountriesCubit>()..getCountries(),
        ),
        BlocProvider(
            create: (context) => getIt<GetRecipesByCountryCubit>()
              ..getRecipesByCountry(isRefresh: true)),
        BlocProvider(
          create: (context) => getIt<GetCategoriesCubit>()..getCategories(),
        ),
      ],
      child: const MyHomePage(),
    ),
    const SavedRecipeScreen(),
    const ChatBot(),
    const ChatBot(),
    BlocProvider(
      create: (context) => getIt<GetUserProfileCubit>()..getUserProfile(),
      child: const MyProfile(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[_controller.index],
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: myScreens,
        navBarHeight: 65.h,
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(IconlyLight.home),
            title: ("Home"),
            iconSize: 25.w,
            textStyle: AppStyles.smallBoldText,
            activeColorPrimary: AppColors.primaryDark,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(IconlyLight.bookmark),
            title: ("Saved"),
            textStyle: AppStyles.smallBoldText,
            iconSize: 25.w,
            activeColorPrimary: AppColors.primaryDark,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(IconlyLight.chat),
            title: ("ChatBot"),
            textStyle: AppStyles.smallBoldText,
            iconSize: 25.w,
            activeColorPrimary: AppColors.primaryDark,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(IconlyLight.buy),
            title: ("Market"),
            iconSize: 25.w,
            textStyle: AppStyles.smallBoldText,
            activeColorPrimary: AppColors.primaryDark,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(IconlyLight.profile),
            title: ("Profile"),
            iconSize: 25.w,
            textStyle: AppStyles.smallBoldText,
            activeColorPrimary: AppColors.primaryDark,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
      ),
    );
  }
}
