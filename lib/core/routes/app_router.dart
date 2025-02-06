import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/screens/no_internet_connection.dart';
import 'package:looqma/core/common/screens/no_route_screen.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:looqma/features/change_password/presentation/views/change_user_password.dart';
import 'package:looqma/features/chat_bot/presentation/views/chat_screen.dart';
import 'package:looqma/features/forget_password/data/repos/forget_password_repo.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:looqma/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:looqma/features/home/presentation/views/home_screen.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/presentation/cubit/login_cubit.dart';
import 'package:looqma/features/login/presentation/views/login_screen.dart';
import 'package:looqma/features/my_profile/presentation/views/screens/my_profile.dart';
import 'package:looqma/features/my_profile/presentation/views/screens/update_profile_info.dart';
import 'package:looqma/features/nav_bar_screen_switcher.dart';
import 'package:looqma/features/on_boarding/on_boarding_screen.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/views/otp_verify_screen.dart';
import 'package:looqma/features/recipe_details/presentation/views/recipe_details_screen.dart';
import 'package:looqma/features/reviews/presentation/views/users_review.dart';
import 'package:looqma/features/search_recipes/presentation/views/search_recipes.dart';
import 'package:looqma/features/sigh_up/data/repos/sighn_up_repo.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';
import 'package:looqma/features/sigh_up/presentation/views/sighn_up_screen.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.onBording:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ForgetPasswordCubit(getIt<ForgetPasswordRepo>()),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.verification:
        final email = argument as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      VerificationCubit(getIt<VerficationRepo>())),
              BlocProvider(
                  create: (context) =>
                      ResendOtpCubit(getIt<VerficationRepo>())),
            ],
            child: OtpVerifyScreen(email: email),
          ),
        );
      case Routes.sighnUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SighnUpCubit(getIt<SighnUpRepo>()),
            child: const SighnUpScreen(),
          ),
        );
      case Routes.navBarScreensSwitcher:
        return MaterialPageRoute(
          builder: (_) => const NavBarScreensSwitcher(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchRecipes(),
        );
      case Routes.showRecipeDetails:
        return MaterialPageRoute(
          builder: (context) => const RecipeDetailsScreen(),
        );
      case Routes.reviewScreen:
        return MaterialPageRoute(
          builder: (context) => const UsersReview(),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => const MyProfile(),
        );
      case Routes.updateProfileInfo:
        return MaterialPageRoute(
          builder: (context) => const UpdateProfileInfo(),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangeUserPassword(),
          ),
        );
      case Routes.noInternet:
        return MaterialPageRoute(
          builder: (_) => const NoInternetConnection(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteScreen(),
        );
    }
  }
}
