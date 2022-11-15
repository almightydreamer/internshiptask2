import 'package:either_dart/either.dart';
import 'package:internshiptask2/clean_architecture/domain/user/repository/user_repository.dart';

import '../../core/request/response.dart';
import '../entity/user_profile_entity.dart';

class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Future<Either<Failure, UserProfileEntity>> call() async {
    return await repository.getUserProfile();
  }
}
