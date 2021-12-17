import 'package:get_it/get_it.dart';
import 'package:yandex_project/application/services/application_apis.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/application/services/connectivity_ensure.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerLazySingleton<ConnectivityEnsure>(() => ConnectivityEnsure());
  locator.registerLazySingleton<AppDBService>(() => AppDBService());
  locator.registerLazySingleton<AppApisService>(() => AppApisService());
}
