import 'package:internshiptask2/clean_architecture/data/core/request_headers.dart';
import 'package:internshiptask2/clean_architecture/domain/user/entity/user_profile_entity.dart';

import '../../core/db/token_cache.dart';
import '../dto/user_dto.dart';



Future<UserLocalDTO> retrieveUser() async {
  late UserLocalDTO user;
  var cache = Cache();
  cache.getUsersStream().listen((usersList) {
    print('Users from stream: $usersList');
    user = usersList
        .map((e) => UserLocalDTO(
            fullName: e.fullName,
            emailAddress: e.emailAddress,
            phoneNumber: e.phoneNumber))
        .toList()
        .first;
  });
  return user;
}

Future<void> deleteUser() async{
  var cache = Cache();
  cache.deleteCurrentUser();
}

Future<void> saveUser(UserLocalDTO user) async {
  var cache = Cache();
  var requestHeaders = RequestParameters.requestHeaders;
  await cache.into(cache.currentUser).insert(CurrentUserCompanion.insert(
      accessToken: requestHeaders['Authorization'] ?? '',
      requestToken: requestHeaders['Refresh'] ?? '',
      fullName: user.fullName ?? '',
      emailAddress: user.emailAddress ?? '',
      phoneNumber: user.phoneNumber ?? ''));
}