import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:internshiptask2/controllers/user_session_controller.dart';
import 'package:internshiptask2/models/response_model.dart';
import 'package:internshiptask2/models/user_model.dart';

import 'api_constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Either<DataValueOnFailure, RegisterDataValueOnSuccess>> registerUser(
      Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(ApiConstants.registerEndpoint,
          data: userData, options: Options(headers: UserSession.requestHeaders));

      return Right(RegisterDataValueOnSuccess.fromJson(response.data));
    } on DioError catch (e) {
      return Left(DataValueOnFailure(e.response?.data));
    }
  }

  Future<Either<DataValueOnFailure, LoginDataValueOnSuccess>> loginUser(
      Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(ApiConstants.loginEndpoint,
          data: userData, options: Options(headers: UserSession.requestHeaders));
      return Right(LoginDataValueOnSuccess.fromJson(response.data));
    } on DioError catch (e) {
      return Left(DataValueOnFailure(e.response?.data));
    }
  }

  Future<Either<DataValueOnFailure, UserProfile>> getUserProfileData() async {
    try {
      print('requestheaders ${UserSession.requestHeaders}');
      Response response = await _dio.get(
        ApiConstants.profileEndpoint,
        options: Options(
          headers: UserSession.requestHeaders,
        ),
      );
      return Right(UserProfile.fromJson(response.data));
    } on DioError catch (e) {
      return Left(DataValueOnFailure(e.response?.data));
    }
  }
// Future<Response> logout() async {
//   //IMPLEMENT USER LOGOUT
// }
}
