import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/screens/no_route_screen.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/home_screen.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/views/cubit/login_cubit.dart';
import 'package:looqma/features/login/views/presentation/login_screen.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/views/cubit/verification_cubit.dart';
import 'package:looqma/features/otp_verify/views/presentation/otp_verify_screen.dart';
import 'package:looqma/features/sigh_up/views/presentation/sighn_up_screen.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: const LoginScreen(),
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
          builder: (_) => const SighnUpScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteScreen(),
        );
    }
  }
}
