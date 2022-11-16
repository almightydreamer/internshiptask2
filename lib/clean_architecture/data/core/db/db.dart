import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:internshiptask2/clean_architecture/data/core/db/tables.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'db.g.dart';

@DriftDatabase(
  tables:[User, Authorization]
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder

    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'shared_preferences.sqlite'));
    return NativeDatabase(file);
  });
}
