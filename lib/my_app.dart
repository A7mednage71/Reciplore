import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/app_router.dart';
import 'package:looqma/core/routes/routes.dart';

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
            initialRoute: Routes.login,
            navigatorKey: GlobalKey<NavigatorState>(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
          );
        });
  }
}
