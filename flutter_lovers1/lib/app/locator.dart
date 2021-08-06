

import 'package:flutter_lovers1/repository/user_repostory.dart';
import 'package:flutter_lovers1/services/fake_auth_service.dart';
import 'package:flutter_lovers1/services/firebase_auth_service.dart';
import 'package:flutter_lovers1/services/firebase_storage_service.dart';
import 'package:flutter_lovers1/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthService());
  locator.registerLazySingleton(() => UserRepostory());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FirebaseStorageService());
}