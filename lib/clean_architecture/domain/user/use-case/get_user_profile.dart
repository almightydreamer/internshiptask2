import 'package:either_dart/either.dart';
import 'package:internshiptask2/clean_architecture/domain/user/repository/user_repository.dart';

import '../../core/request/response.dart';
import '../entity/user_profile_entity.dart';

class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Stream<Either<Failure, UserProfileEntity>> call() async* {
    var dbResponse = await repository.getLocalUserProfile();
    UserProfileEntity? userProfileEntity;
    dbResponse.fold((l) => null, (r) {
      userProfileEntity = r;
    });
    if (userProfileEntity != null) {
      yield Right(userProfileEntity!);
    }
    yield await repository.getApiUserProfile();
  }
}
