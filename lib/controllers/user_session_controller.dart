import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:internshiptask2/pages/credentials/controllers/login_controller.dart';

import '../cache/token_cache.dart';
import '../models/user_model.dart';

class UserSession {
  final cache = Cache();

  static Map<String, String> requestHeaders = {
    'app-id': '6112dc7c3f812e0d9b6679dd'
  };
  static final UserSession _singleton = UserSession._internal();

  factory UserSession() {
    return _singleton;
  }

  UserSession._internal();

  UserProfile? userProfile;

  void signOut() async {
    requestHeaders['Refresh'] = '';
    requestHeaders['Authorization'] = '';

    userProfile = null;
    cache.deleteCurrentUser();
    final token = await cache.select(cache.currentUser).get();
    print(token.toString());
  }

  Future<void> updateCache() async {
    var res = await LoginController().getProfile();
    userProfile = res.fold((l) => null, (r) => r);

    print('userProfile $userProfile}');
    await cache.into(cache.currentUser).insert(CurrentUserCompanion.insert(
        accessToken: requestHeaders['Authorization'] ?? "",
        requestToken: requestHeaders['Refresh'] ?? "",
        fullName: userProfile?.fullName ?? '',
        emailAddress: userProfile?.emailAddress ?? '',
        phoneNumber: userProfile?.phoneNumber ?? ''));
    final currentUser = await cache.select(cache.currentUser).get();
    print('updated cache token ${currentUser.toString()}');
  }

  bool availableCache() {
    if (cache.currentUser.accessToken != '' &&
        cache.currentUser.requestToken != '') {
      return true;
    } else {
      return false;
    }
  }
}

class CachedSession extends GetxController {
  RxBool cacheLoaded = false.obs;
}
