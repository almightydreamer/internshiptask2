import 'package:drift/drift.dart';
import 'package:internshiptask2/clean_architecture/data/core/db/db.dart';
import 'package:internshiptask2/clean_architecture/data/core/request_headers.dart';

import '../dto/user_local_dto.dart';

class UserLocalDataSource {
  final LocalDatabase db;

  const UserLocalDataSource({required this.db});

  Future<UserData> retrieveUser() async {
    var query = db.user.select()
      ..limit(1);
    return (await query.get()).first;
  }

  Future<void> deleteUser() async {}

  Future<void> saveUser(UserData user) async {
    var request = RequestParameters.requestHeaders;
    await db.into(db.user).insert(user);
  }
}
