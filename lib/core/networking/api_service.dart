import 'package:dio/dio.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/features/login/data/models/login_request_model.dart';
import 'package:looqma/features/login/data/models/login_response_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrlEmulator)
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
}
