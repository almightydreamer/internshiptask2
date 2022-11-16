import 'package:internshiptask2/cache/token_cache.dart';
import 'package:internshiptask2/clean_architecture/data/core/db/db.dart';

import '../../../../../models/user_model.dart';
import '../../../domain/user/entity/user_profile_entity.dart';
import '../../core/request_headers.dart';
import '../dto/user_api_dto.dart';
import '../dto/user_local_dto.dart';

class UserMapper {
  UserProfileEntity mapApiToEntity(UserApiDTO input) {
    return UserProfileEntity(
        id: input.id,
        fullName: input.fullName,
        emailAddress: input.emailAddress,
        phoneNumber: input.phoneNumber,
        profilePicture: input.profilePicture);
  }

  UserProfileEntity mapLocalToEntity(UserLocalDTO input) {
    return UserProfileEntity(
        id: input.id,
        fullName: input.fullName,
        emailAddress: input.emailAddress,
        phoneNumber: input.phoneNumber,
        profilePicture: input.profilePicture);
  }

  UserData entityToMap(UserProfileEntity input) {
    return UserData(
        id: input.id,
        fullName: input.fullName,
        phoneNumber: input.phoneNumber);
  }
}
