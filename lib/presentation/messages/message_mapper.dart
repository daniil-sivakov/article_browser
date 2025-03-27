import 'package:article_browser/presentation/localization/localization_plug.dart';
import 'package:article_browser/presentation/messages/data_processing_message.dart';
import 'package:flutter/widgets.dart';

class MessageMapper {
  String localize(BuildContext _, DataProcessingMessage message) {
    final String localizedMessage = switch (message) {
      DataProcessingMessage.fetchedFromNetwork =>
        LocalizationPlug.fetchedFromNetworkMessage,
      DataProcessingMessage.loadedFromCache =>
        LocalizationPlug.loadedFromCacheMessage,
      DataProcessingMessage.errorNoInternet =>
        LocalizationPlug.errorNoInternetMessage,
      DataProcessingMessage.errorNoDataFound =>
        LocalizationPlug.errorNoDataFoundMessage,
      DataProcessingMessage.noDataInLocalCache =>
        LocalizationPlug.noDataInCacheMessage,
      DataProcessingMessage.unknownError =>
        LocalizationPlug.unknownErrorMessage,
    };

    return localizedMessage;
  }
}
