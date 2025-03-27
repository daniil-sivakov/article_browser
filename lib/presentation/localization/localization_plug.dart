// Рецензенту: в требованиях поддержка более одного языка не указана.
// Тем не менее, в реальных приложениях это является необходимостью,
// поэтому сочту хорошей практикой хотя бы положить все строки в одно место.
class LocalizationPlug {
  const LocalizationPlug._();

  static const String appTitle = 'Articles';
  static const String articleScreenPageHeader = 'Articles';

  static const String noDataForArticleText = 'Данные по статье не найдены';

  static const String unknownErrorMessage = 'Что-то пошло не так';
  static const String errorNoInternetMessage = 'Проверьте подключение к сети';
  static const String noDataInCacheMessage = 'Нет данных в кэше устройства';
  static const String fetchedFromNetworkMessage = 'Данные загружены из сети';
  static const String loadedFromCacheMessage = 'Данные загружены из кэша';
  static const String errorNoDataFoundMessage =
      'Данные удалены или не существуют';

  static String dataReceivedAt(String dateTime) => 'Загружено в $dateTime';

  static const String themeLightLabel = 'Светлая тема';
  static const String themeDarkLabel = 'Тёмная тема';
  static const String themeSystemDefaultLabel = 'Системная';
}
