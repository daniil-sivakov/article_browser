// Рецензенту: для тестового приложения сочту подходящим простой и надёжный способ
// проверки интернет-соединения - head-запрос на 'https://www.google.com/'
//
// Другие возможные решения:
//
// https://pub.dev/packages/connectivity_plus
//   - проверяет наличие сети на устройстве, но не наличие интернет-соединения
// https://pub.dev/packages/observe_internet_connectivity
//   - периодически пингует Google и Cloudflare (по умолчанию)
// https://pub.dev/packages/internet_connection_checker
//   - комбинирует два вышеуказанных подхода для достижения большей гибкости

import 'package:article_browser/core/logging/logger.dart';
import 'package:article_browser/core/services/network_connection_service.dart';
import 'package:http/http.dart';

class SimpleNetworkConnectionService implements NetworkConnectionService {
  const SimpleNetworkConnectionService(this.logger);

  final Logger logger;

  @override
  Future<NetworkConnectionState> checkConnection() async {
    try {
      await head(Uri.parse('https://www.google.com/'));
      return NetworkConnectionState.hasConnection;
    } catch (error) {
      logger.log(error);
      return NetworkConnectionState.noConnection;
    }
  }
}
