import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/app/internet_checker.dart';
import 'package:looqma/core/routes/app_router.dart';
import 'package:looqma/core/routes/routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Looqma',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.getRoute,
          initialRoute:
              isUserlogged ? Routes.navBarScreensSwitcher : Routes.onBording,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          builder: (context, child) {
            return StreamBuilder<bool>(
              stream: InternetChecker().onConnectionChange,
              builder: (context, snapshot) {
                // final isConnected = snapshot.data ?? false;
                // if (!isConnected) {
                //   return const NoInternetConnection();
                // }
                return child!;
              },
            );
          },
        );
      },
    );
  }
}
