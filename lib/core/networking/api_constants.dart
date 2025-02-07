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
}
