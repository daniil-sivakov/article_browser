import 'package:article_browser/domain/models/data_source/data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reception_details.freezed.dart';
part 'reception_details.g.dart';

@freezed
abstract class ReceptionDetails with _$ReceptionDetails {
  const ReceptionDetails._();

  const factory ReceptionDetails({
    required DateTime dataReceivedAt,
    required DataSource dataSource,
  }) = _ReceptionDetails;

  factory ReceptionDetails.fromJson(Map<String, Object?> json) =>
      _$ReceptionDetailsFromJson(json);

  ReceptionDetails asCached() {
    return ReceptionDetails(
      dataReceivedAt: dataReceivedAt,
      dataSource: DataSource.cache,
    );
  }
}
