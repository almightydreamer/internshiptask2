import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../domain/core/request/response.dart';
import '../../core/api_constants.dart';
import '../../core/request_headers.dart';
import '../dto/request_token_dto.dart';
import '../dto/user_api_dto.dart';

class UserApiDataSource {
  final Dio _dio = Dio();
  var requestHeaders = RequestParameters.requestHeaders;

  Future<Response<dynamic>> registerUser(
      Map<String, dynamic>? userData) async {
    return _dio.post(ApiConstants.registerEndpoint,
        data: userData, options: Options(headers: requestHeaders));
  }

  Future<Response<dynamic>> loginUser(
      Map<String, dynamic>? userData) async {
    return _dio.post(ApiConstants.loginEndpoint,
          data: userData, options: Options(headers: RequestParameters.requestHeaders));

  }

  Future<Response<dynamic>> getUserProfileData() async {
      return _dio.get(
        ApiConstants.profileEndpoint,
        options: Options(
          headers: requestHeaders,
        ),
      );
  }}
