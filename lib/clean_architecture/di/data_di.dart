import 'package:get_it/get_it.dart';
import 'package:internshiptask2/clean_architecture/data/user/datasource/user_local_data_source.dart';

import '../data/core/db/db.dart';

Future<void> init() async {
  final dataDi = GetIt.instance;

  dataDi.registerLazySingleton<LocalDatabase>(() => LocalDatabase());

  dataDi.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(db: dataDi<LocalDatabase>()));
}
