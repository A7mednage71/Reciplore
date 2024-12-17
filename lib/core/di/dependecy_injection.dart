import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:looqma/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // create dio factory instance
  Dio dio = await DioFactory.getDio();
}
