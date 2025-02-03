import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/bloc_observer.dart';
import 'package:looqma/core/app/constants.dart';
import 'package:looqma/core/app/internet_checker.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/services/secure_storage/secure_storage.dart';
import 'package:looqma/core/services/secure_storage/secure_storage_keys.dart';
import 'package:looqma/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  await InternetChecker().initialize();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  await checkUserLogging();
  await setupGetIt();
  runApp(const MyApp());
}

Future<void> checkUserLogging() async {
  String? userToken =
      await SecureStorage.getSecuredData(SecureStorageKeys.accessToken);
  log(userToken.toString());
  if (userToken != "" && userToken.isNotEmpty) {
    isUserlogged = true;
  } else {
    isUserlogged = false;
  }
}
