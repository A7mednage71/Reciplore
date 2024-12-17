import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/dio_factory.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/views/cubit/login_cubit.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/views/cubit/verification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // create dio factory instance
  Dio dio = await DioFactory.getDio();

  getIt
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    // create login repository instance
    ..registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()))
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()))

    // create verification repository instance
    ..registerLazySingleton<VerficationRepo>(
        () => VerficationRepo(getIt<ApiService>()))
    ..registerFactory<VerificationCubit>(
        () => VerificationCubit(getIt<VerficationRepo>()));
}
