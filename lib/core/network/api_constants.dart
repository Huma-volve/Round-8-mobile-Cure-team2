class ApiConstants {
  const ApiConstants._();
  static const String baseUrl = 'https://round8-cure-php-team-two.huma-volve.com/api/v1/';

  ///connections
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  /// API Endpoints


  /// HTTP Status Codes
  static const int success = 200;
  static const int created = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int unSufficientCredits = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int unProcessable = 422;
  static const int serverError = 500;
}

class ApiEndPoints{
   const ApiEndPoints._() ;
  static const _home ='home' ;
  static const specialists= "$_home/specialties" ;


}
