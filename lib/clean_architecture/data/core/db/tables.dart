import 'package:drift/drift.dart';

class User extends Table {

  IntColumn get id => integer()();

  TextColumn get fullName => text()();

  TextColumn get phoneNumber => text().nullable()();

}

class Authorization extends Table {

  TextColumn get refreshToken => text()();

  TextColumn get accessToken => text()();

}