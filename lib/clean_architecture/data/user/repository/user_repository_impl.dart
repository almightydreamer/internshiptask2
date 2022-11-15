import 'package:either_dart/either.dart';
import 'package:internshiptask2/clean_architecture/data/user/mapper/user_mapper.dart';
import 'package:internshiptask2/clean_architecture/domain/user/entity/user_profile_entity.dart';

import '../../../domain/core/request/response.dart';
import '../../../domain/user/repository/user_repository.dart';
import '../datasource/user_remote_datasource.dart';
import '../dto/user_dto.dart';

class UserRepositoryImpl extends UserRepository {
  late UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl({
    required UserRemoteDataSource userRemoteDataSource,
  }) {
    _remoteDataSource = userRemoteDataSource;
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfile({
    required String userId,
  }) async {
    try {
      var response =
          await _remoteDataSource.getUserProfileData();

      UserProfileEntity result =
          UserMapper().mapApiToEntity(userDto as UserProfileEntity);

      return Right(result);
    } catch (e, s) {
      return Left(ApiFailure(e, s));
    }
  }
}
