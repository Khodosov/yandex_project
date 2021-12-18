import 'package:get_it/get_it.dart';
import 'package:yandex_project/application/services/application_apis.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/application/services/connectivity_ensure.dart';

class Locator {
  const Locator._();

  static final GetIt _locator = GetIt.instance;

  static initLocator() {
    _locator.registerLazySingleton<ConnectivityEnsure>(() => ConnectivityEnsure());
    _locator.registerLazySingleton<AppDBService>(() => AppDBService());
    _locator.registerLazySingleton<AppApisService>(() => AppApisService());
  }

  static ConnectivityEnsure get connectivity => _locator<ConnectivityEnsure>();

  static AppDBService get dataBase => _locator<AppDBService>();

  static AppApisService get network => _locator<AppApisService>();
}
