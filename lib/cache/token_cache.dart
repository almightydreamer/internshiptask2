
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'token_cache.g.dart';


@DriftDatabase(
  include: {'cache.drift'},
)
class Cache extends _$Cache {
  Cache() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Stream<List<CurrentUserData>> getUsersStream(){
    var query = select(currentUser);
    return query.watch();
  }
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




