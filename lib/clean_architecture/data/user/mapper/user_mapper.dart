import '../../../../../models/user_model.dart';
import '../../../domain/user/entity/user_profile_entity.dart';
import '../dto/user_dto.dart';

class UserMapper {
  UserProfileEntity mapApiToEntity(UserAPIDTO input) {
    return UserProfileEntity(
        id: input.id,
        fullName: input.fullName,
        emailAddress: input.emailAddress,
        phoneNumber: input.phoneNumber,
        profilePicture: input.profilePicture);
  }
}
