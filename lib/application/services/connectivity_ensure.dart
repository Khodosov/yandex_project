import 'package:connectivity/connectivity.dart';

class ConnectivityEnsure {
  final _connectivity = Connectivity();

  Stream<bool> get isConnectedStream async* {
    yield await isConnected;
    yield* _connectivity.onConnectivityChanged.map((event) => event != ConnectivityResult.none).distinct();
  }

  Future<bool> get isConnected async => await _connectivity.checkConnectivity() != ConnectivityResult.none;
}
