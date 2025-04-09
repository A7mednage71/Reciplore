import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:looqma/core/common/recipe_save_toggle/cubit/recipe_save_toggle_cubit.dart';
import 'package:looqma/core/common/recipe_save_toggle/repos/recipe_save_toggle_repo.dart';
import 'package:looqma/core/networking/api_service.dart';
import 'package:looqma/core/networking/dio_factory.dart';
import 'package:looqma/features/category_recipes/presentation/cubit/get_recipes_by_category/get_recipes_by_category_cubit.dart';
import 'package:looqma/features/change_password/data/repos/change_password_repo.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:looqma/features/forget_password/data/repos/forget_password_repo.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:looqma/features/home/data/repos/home_repo.dart';
import 'package:looqma/features/home/presentation/cubit/get_categories/get_categories_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_countries/get_countries_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_new_recipes/get_new_recipes_cubit.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/home_market/data/repos/home_market_repo.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/presentation/cubit/login_cubit.dart';
import 'package:looqma/features/my_profile/data/repos/user_profile_repo.dart';
import 'package:looqma/features/my_profile/presentation/cubit/delete_user_image/delete_user_image_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/get_user_profile/get_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/update_user_profile/update_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/cubit/upload_user_image/upload_user_image_cubit.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'package:looqma/features/saved_recipe/data/repos/saved_recipes_repo.dart';
import 'package:looqma/features/saved_recipe/presentation/cubit/get_saved_recipes/get_saved_recipes_cubit.dart';
import 'package:looqma/features/search_recipes/data/repos/search_repo.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/sigh_up/data/repos/sighn_up_repo.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';

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
        () => VerificationCubit(getIt<VerficationRepo>()))
    ..registerFactory<ResendOtpCubit>(
        () => ResendOtpCubit(getIt<VerficationRepo>()))

    // create forget password repository instance
    ..registerLazySingleton<ForgetPasswordRepo>(
        () => ForgetPasswordRepo(getIt<ApiService>()))
    ..registerFactory<ForgetPasswordCubit>(
        () => ForgetPasswordCubit(getIt<ForgetPasswordRepo>()))

    // create sign up repository instance
    ..registerLazySingleton<SighnUpRepo>(() => SighnUpRepo(getIt<ApiService>()))
    ..registerFactory<SighnUpCubit>(() => SighnUpCubit(getIt<SighnUpRepo>()))

    // create get user profile repository instance
    ..registerLazySingleton<UserProfileRepo>(
        () => UserProfileRepo(getIt<ApiService>()))
    ..registerFactory<GetUserProfileCubit>(
        () => GetUserProfileCubit(getIt<UserProfileRepo>()))
    // upload profile image
    ..registerFactory<UploadUserImageCubit>(
        () => UploadUserImageCubit(getIt<UserProfileRepo>()))
    // delete profile image
    ..registerFactory<DeleteUserImageCubit>(
        () => DeleteUserImageCubit(getIt<UserProfileRepo>()))
    ..registerFactory<UpdateUserProfileCubit>(
        () => UpdateUserProfileCubit(getIt<UserProfileRepo>()))
    // change password
    ..registerLazySingleton<ChangePasswordRepo>(
        () => ChangePasswordRepo(getIt<ApiService>()))
    ..registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(getIt<ChangePasswordRepo>()))
    // home screen dependencies
    ..registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()))
    ..registerFactory<GetCountriesCubit>(
        () => GetCountriesCubit(getIt<HomeRepo>()))
    ..registerFactory<GetCategoriesCubit>(
        () => GetCategoriesCubit(getIt<HomeRepo>()))
    ..registerFactory<GetRecipesByCategoryCubit>(
        () => GetRecipesByCategoryCubit(getIt<HomeRepo>()))
    ..registerFactory<GetRecipesByCountryCubit>(
        () => GetRecipesByCountryCubit(getIt<HomeRepo>()))
    ..registerFactory<GetNewRecipesCubit>(
        () => GetNewRecipesCubit(getIt<HomeRepo>()))
    // search screen
    ..registerLazySingleton<SearchRepo>(() => SearchRepo(getIt<ApiService>()))
    ..registerFactory<SearchRecipeCubit>(
        () => SearchRecipeCubit(getIt<SearchRepo>()))
    // recipe save toggle
    ..registerLazySingleton<RecipeSaveToggleRepo>(
        () => RecipeSaveToggleRepo(getIt<ApiService>()))
    ..registerFactory<RecipeSaveToggleCubit>(
        () => RecipeSaveToggleCubit(getIt<RecipeSaveToggleRepo>()))
    // get saved recipes
    ..registerLazySingleton<SavedRecipesRepo>(
        () => SavedRecipesRepo(getIt<ApiService>()))
    ..registerFactory<GetSavedRecipesCubit>(
        () => GetSavedRecipesCubit(getIt<SavedRecipesRepo>()))

    // home market
    ..registerLazySingleton<HomeMarketRepo>(
        () => HomeMarketRepo(getIt<ApiService>()))
    ..registerFactory<HomeMarketCubit>(
        () => HomeMarketCubit(getIt<HomeMarketRepo>()));
}
