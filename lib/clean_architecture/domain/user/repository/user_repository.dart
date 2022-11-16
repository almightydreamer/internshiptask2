import 'package:either_dart/either.dart';

import '../../core/request/response.dart';
import '../entity/user_profile_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserProfileEntity>> getApiUserProfile();
  Future<Either<Failure, UserProfileEntity>> getLocalUserProfile();
}
