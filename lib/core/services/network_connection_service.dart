enum NetworkConnectionState { hasConnection, noConnection }

// Рецензенту: делаю интерфейс и перечисление, чтобы не зависеть от сущностей,
// поставляемых тем или иным решением.
abstract class NetworkConnectionService {
  Future<NetworkConnectionState> checkConnection();
}
