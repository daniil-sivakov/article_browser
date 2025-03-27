import 'dart:convert';

import 'package:article_browser/domain/models/article_details/article_details.dart';

class ArticleDetailsCodec {
  const ArticleDetailsCodec();

  ArticleDetails decodeDetailsFromJson(String detailsJsonString) {
    return ArticleDetails.fromJson(jsonDecode(detailsJsonString));
  }

  String encodeToJsonString(ArticleDetails articleDetails) {
    return jsonEncode(articleDetails.toJson());
  }
}
