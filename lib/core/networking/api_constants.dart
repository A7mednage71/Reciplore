class ApiConstants {
  // base url for local server
  static const String baseUrlLocalServer = 'http://localhost:3000/';
  static const String baseUrlEmulator = 'http://10.0.2.2:3000/';

  // base url for deployed server
  static const String baseUrlDeployedServer =
      'https://graduation-project-ev6n-yous0001s-projects.vercel.app/';

  static const String login = 'auth/login';
  static const String verifyLogin = 'auth/verify-login';
  static const String resendOtp = '/auth/resend-otp';
  static const String forgetPassword = '/auth/forget-password';
  static const String signUp = '/auth/register';
  static const String userProfile = '/auth/get-profile';
  static const String uploadUserImage = '/auth/upload-profileImg';
  static const String updateUser = '/auth/update-user';
  static const String deleteUserImage = '/auth/delete-profileImg';
  static const String changePassword = '/auth/change-password';

  // tokens for authentication
  static const String accessTokenPrefix = 'accessToken_';
  static const String refreshToken = '/auth/refresh-token';

  // home screen end points
  static const String allCountries = '/country';
  static const String allCategories = '/category';
  static const String getRecipes = '/recipe/list';
  static const String recipeSaveToggle = '/auth/toogle-favourite/{id}';
  static const String getSavedRecipes = '/auth/get-favourite';

  // market end points
  static const String getIngredients = '/ingredient/list';
  static const String getMarketBanners = '/banner/mobile_market';

  // reviews and ratings end points
  static const String addReview = '/review/add';
  static const String makeReaction = '/review/reaction/{id}';
  static const String getReviews = '/review/';

  // cart end points
  static const String getCart = '/cart/';
  static const String addToCart = '/cart/add';
  static const String removeFromCart = '/cart/remove/{id}';
  static const String updateCart = '/cart/update/{id}';
  static const String clearCart = '/cart/clear';
}
