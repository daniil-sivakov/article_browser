import 'dart:convert';

import 'package:article_browser/domain/models/article_previews/article_previews.dart';

class ArticlePreviewsCodec {
  const ArticlePreviewsCodec();

  ArticlePreviews decodePreviewsFromJson(String previewsJsonString) {
    return ArticlePreviews.fromJson(jsonDecode(previewsJsonString));
  }

  String encodeToJsonString(ArticlePreviews articlePreviews) {
    return jsonEncode(articlePreviews.toJson());
  }
}
