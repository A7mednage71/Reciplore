import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/features/change_password/data/models/change_password_request_model.dart';
import 'package:looqma/features/change_password/data/models/change_password_response_model.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_response.dart';
import 'package:looqma/features/login/data/models/login_request_model.dart';
import 'package:looqma/features/login/data/models/login_response_model.dart';
import 'package:looqma/features/my_profile/data/models/delete_profile_image_model.dart';
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

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel body,
  );

  @GET(ApiConstants.verifyLogin)
  Future<VerifyResponseModel> verifyLogin(
    @Body() VerifyRequestModel body,
  );

  @GET(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
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
}
