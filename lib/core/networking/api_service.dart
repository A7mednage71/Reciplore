import 'package:dio/dio.dart';
import 'package:looqma/core/common/recipe_save_toggle/models/recipe_save_toggle_reponse_model.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/core/networking/refresh_token/refresh_token_response_model.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/change_password/data/models/change_password_request_model.dart';
import 'package:looqma/features/change_password/data/models/change_password_response_model.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';
import 'package:looqma/features/home/data/models/get_recipes_request.dart';
import 'package:looqma/features/home/data/models/get_recipes_response_model.dart';
import 'package:looqma/features/login/data/models/login_request_model.dart';
import 'package:looqma/features/my_profile/data/models/delete_profile_image_model.dart';
import 'package:looqma/features/my_profile/data/models/update_user_info_request_model.dart';
import 'package:looqma/features/my_profile/data/models/update_user_info_response_model.dart';
import 'package:looqma/features/my_profile/data/models/upload_profile_image_model.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/otp_verify/data/models/resend_otp_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/resend_otp_response_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_response_model.dart';
import 'package:looqma/features/sigh_up/data/models/sign_up_request_model.dart';
import 'package:looqma/features/sigh_up/data/models/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrlDeployedServer)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.refreshToken)
  Future<RefreshTokenResponseModel> refreshToken(
    @Header("refreshtoken") String refreshToken,
  );

  @POST(ApiConstants.login)
  Future<ResponseMessageModel> login(
    @Body() LoginRequestModel body,
  );

  @GET(ApiConstants.verifyLogin)
  Future<VerifyResponseModel> verifyLogin(
    @Body() VerifyRequestModel body,
  );

  @GET(ApiConstants.forgetPassword)
  Future<ResponseMessageModel> forgetPassword(
    @Body() ForgetPasswordRequestModel body,
  );

  @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signUp(
    @Body() SignUpRequestModel body,
  );

  @GET(ApiConstants.resendOtp)
  Future<ResendOtpResponseModel> resendOtp(
    @Body() ResendOtpRequestModel body,
  );

  @GET(ApiConstants.userProfile)
  Future<UserProfileResponseModel> getUserProfile();

  @PUT(ApiConstants.updateUser)
  Future<UpdateUserinfoResponseModel> updateUserInfo(
    @Body() UpdateUserInfoRequestModel body,
  );

  @POST(ApiConstants.uploadUserImage)
  Future<UploadProfileImageModel> uploadUserImage(
    @Body() FormData file,
  );

  @DELETE(ApiConstants.deleteUserImage)
  Future<DeleteProfileImageModel> deleteUserImage();

  @PUT(ApiConstants.changePassword)
  Future<ChangePasswordResponseModel> changePassword(
    @Body() ChangePasswordRequestModel body,
  );

  // home screen services
  @GET(ApiConstants.allCountries)
  Future<AllCountriesModel> getAllCountries();

  @GET(ApiConstants.allCategories)
  Future<AllCategoriesModel> getAllCategories();

  @GET(ApiConstants.getRecipes)
  Future<GetRecipesResponseModel> getRecipes(
    @Queries() GetRecipesRequest request,
  );

  @POST(ApiConstants.recipeSaveToggle)
  Future<RecipeSaveToggleReponseModel> recipeSaveToggle(@Path('id') String id);

  @GET(ApiConstants.getSavedRecipes)
  Future<GetRecipesResponseModel> getSavedRecipes();
}
