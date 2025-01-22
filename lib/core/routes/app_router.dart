import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/screens/no_internet_connection.dart';
import 'package:looqma/core/common/screens/no_route_screen.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/forget_password/data/repos/forget_password_repo.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:looqma/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:looqma/features/home/presentation/views/home_screen.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/presentation/cubit/login_cubit.dart';
import 'package:looqma/features/login/presentation/views/login_screen.dart';
import 'package:looqma/features/on_boarding/on_boarding_screen.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/views/otp_verify_screen.dart';
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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VerificationCubit(getIt<VerficationRepo>()),
            child: const OtpVerifyScreen(),
          ),
        );
      case Routes.sighnUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SighnUpCubit(getIt<SighnUpRepo>()),
            child: const SighnUpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
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
