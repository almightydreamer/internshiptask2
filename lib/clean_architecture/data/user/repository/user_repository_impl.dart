import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:internshiptask2/clean_architecture/data/user/datasource/user_local_data_source.dart';
import 'package:internshiptask2/clean_architecture/data/user/mapper/user_mapper.dart';
import 'package:internshiptask2/clean_architecture/domain/user/entity/user_profile_entity.dart';

import '../../../domain/core/request/response.dart';
import '../../../domain/user/repository/user_repository.dart';
import '../datasource/user_api_datasource.dart';
import '../dto/user_api_dto.dart';
import '../dto/user_local_dto.dart';

class UserRepositoryImpl implements UserRepository {
  late UserApiDataSource _apiDataSource;
  late UserLocalDataSource _localDataSource;

  UserRepositoryImpl({
    required UserApiDataSource userApiDataSource,
    required UserLocalDataSource userLocalDataSource
  }) {
    _apiDataSource = userApiDataSource;
    _localDataSource = userLocalDataSource;
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getApiUserProfile() async {
    try {
      var response = await _apiDataSource.getUserProfileData();
      if (response.statusCode != HttpStatus.ok) {
        return Left(ApiFailure(response.data, StackTrace.current));
      }
      UserApiDTO userApiDto = UserApiDTO.fromJson(response.data);
      UserProfileEntity entity = UserMapper().mapApiToEntity(userApiDto);

      return Right(entity);
    } catch (e, s) {
      return Left(OtherFailure(e, s));
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getLocalUserProfile() async{
    try {
      var data = _localDataSource.db.user;
      UserLocalDTO userLocalDTO = UserLocalDTO.fromJson(data);
      UserProfileEntity entity = UserMapper().mapLocalToEntity(userLocalDTO);
      return Right(entity);
    } catch(e, s) {
      return Left(OtherFailure(e,s));
    }
  }

}
