import 'package:dio/dio.dart';
import 'package:looqma/core/common/models/get_ingredients_query_model.dart';
import 'package:looqma/core/common/models/get_ingredients_response_model.dart';
import 'package:looqma/core/common/models/get_recipes_query_model.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/refresh_token_response_model.dart';
import 'package:looqma/core/networking/api_constants.dart';
import 'package:looqma/core/networking/response_message_model.dart';
import 'package:looqma/features/cart/data/models/add_to_cart_request_model.dart';
import 'package:looqma/features/cart/data/models/get_cart_reponse_model.dart';
import 'package:looqma/features/cart/data/models/update_cart_request_model.dart';
import 'package:looqma/features/change_password/data/models/change_password_request_model.dart';
import 'package:looqma/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/data/models/all_countries_model.dart';
import 'package:looqma/features/home_market/data/models/market_banners_reponse_model.dart';
import 'package:looqma/features/login/data/models/login_request_model.dart';
import 'package:looqma/features/my_profile/data/models/update_user_info_request_model.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/otp_verify/data/models/resend_otp_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_request_model.dart';
import 'package:looqma/features/otp_verify/data/models/verify_response_model.dart';
import 'package:looqma/features/reviews/data/models/add_review_request_model.dart';
import 'package:looqma/features/reviews/data/models/add_review_response_model.dart';
import 'package:looqma/features/reviews/data/models/get_reviews_response_model.dart';
import 'package:looqma/features/sigh_up/data/models/sign_up_request_model.dart';
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
  Future<ResponseMessageModel> signUp(
    @Body() SignUpRequestModel body,
  );

  @GET(ApiConstants.resendOtp)
  Future<ResponseMessageModel> resendOtp(
    @Body() ResendOtpRequestModel body,
  );

  @GET(ApiConstants.userProfile)
  Future<UserProfileResponseModel> getUserProfile();

  @PUT(ApiConstants.updateUser)
  Future<ResponseMessageModel> updateUserInfo(
    @Body() UpdateUserInfoRequestModel body,
  );

  @POST(ApiConstants.uploadUserImage)
  Future<ResponseMessageModel> uploadUserImage(
    @Body() FormData file,
  );

  @DELETE(ApiConstants.deleteUserImage)
  Future<ResponseMessageModel> deleteUserImage();

  @PUT(ApiConstants.changePassword)
  Future<ResponseMessageModel> changePassword(
    @Body() ChangePasswordRequestModel body,
  );

  // home screen services
  @GET(ApiConstants.allCountries)
  Future<AllCountriesModel> getAllCountries();

  @GET(ApiConstants.allCategories)
  Future<AllCategoriesModel> getAllCategories();

  @GET(ApiConstants.getRecipes)
  Future<GetRecipesResponseModel> getRecipes(
    @Queries() GetRecipesQueryModel request,
  );

  @POST(ApiConstants.recipeSaveToggle)
  Future<ResponseMessageModel> recipeSaveToggle(@Path('id') String id);

  @GET(ApiConstants.getSavedRecipes)
  Future<GetRecipesResponseModel> getSavedRecipes();

  // home market services
  @GET(ApiConstants.getIngredients)
  Future<GetIngredientsResponseModel> getIngredients(
    @Queries() GetIngredientsQueryModel request,
  );

  @GET(ApiConstants.getMarketBanners)
  Future<MarketBannersReponseModel> getMarketBanners();

  // cart services
  @GET(ApiConstants.getCart)
  Future<GetCartReponseModel> getCart();

  @POST(ApiConstants.addToCart)
  Future<ResponseMessageModel> addToCart(
    @Body() AddToCartRequestModel body,
  );

  @PUT(ApiConstants.removeFromCart)
  Future<ResponseMessageModel> removeFromCart(@Path('id') String id);

  @PUT(ApiConstants.updateCart)
  Future<ResponseMessageModel> updateCart(
    @Path('id') String id,
    @Body() UpdateCartRequestModel body,
  );

  @DELETE(ApiConstants.clearCart)
  Future<ResponseMessageModel> clearCart();

  // rate and review services
  @POST(ApiConstants.addReview)
  Future<AddReviewResponseModel> addReview(
    @Body() AddReviewRequestModel body,
  );

  @POST(ApiConstants.makeReaction)
  Future<ResponseMessageModel> makeReaction(
    @Path('id') String id,
    @Query('action') String reaction,
  );

  @GET(ApiConstants.getReviews)
  Future<GetReviewsResponseModel> getReviews(
    @Query('recipeId') String? recipeId,
    @Query('ingredientId') String? ingredientId,
  );
}
