import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/app/internet_checker.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/routes/app_router.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_new_recipes/get_new_recipes_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<RecipeSaveToggleCubit>()),
            BlocProvider(create: (context) => getIt<GetSavedRecipesCubit>()),
            BlocProvider(
                create: (context) => getIt<GetRecipesByCategoryCubit>()),
            BlocProvider(
              create: (context) =>
                  getIt<GetNewRecipesCubit>()..getNewRecipes(isRefresh: true),
            ),
            BlocProvider(
                create: (context) => getIt<GetRecipesByCountryCubit>()
                  ..getRecipesByCountry(isRefresh: true)),
          ],
          child: MaterialApp(
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
          ),
        );
      },
    );
  }
}
