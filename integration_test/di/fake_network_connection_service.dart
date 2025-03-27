import 'package:article_browser/core/services/network_connection_service.dart';

class FakeNetworkConnectionService implements NetworkConnectionService {
  bool isConnected = true;

  @override
  Future<NetworkConnectionState> checkConnection() async {
    return isConnected
        ? NetworkConnectionState.hasConnection
        : NetworkConnectionState.noConnection;
  }
}
