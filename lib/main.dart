import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/app/bloc_observer.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  await setupGetIt();
  runApp(const MyApp());
}
