class ApiConstants {

  // // // ENDPOINTS FOR USER LOGGING API
  //

  static String usersUrl = 'http://mobile-shop-api.hiring.devebs.net/users';
  static String loginEndpoint = ('$usersUrl/login');
  static String registerEndpoint = ('$usersUrl/register');
  static String profileEndpoint = ('$usersUrl/profile');
  static String refreshEndpoint = ('$usersUrl/refresh');

  //
  // // // ENDPOINTS FOR USER LOGGING API



  // // // ENDPOINTS FOR HOME ARTICLES API
  //

  static String baseUrl = 'https://fitness-app-api.k8s.devebs.net/workout';
  static String goalsEndpoint = '$baseUrl/goal';
  static String exercisesEndpoint = '$baseUrl/exercise';

  //
  // // // ENDPOINTS FOR HOME ARTICLES API

}
