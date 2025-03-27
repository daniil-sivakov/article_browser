// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reception_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceptionDetails _$ReceptionDetailsFromJson(Map<String, dynamic> json) =>
    _ReceptionDetails(
      dataReceivedAt: DateTime.parse(json['dataReceivedAt'] as String),
      dataSource: $enumDecode(_$DataSourceEnumMap, json['dataSource']),
    );

Map<String, dynamic> _$ReceptionDetailsToJson(_ReceptionDetails instance) =>
    <String, dynamic>{
      'dataReceivedAt': instance.dataReceivedAt.toIso8601String(),
      'dataSource': _$DataSourceEnumMap[instance.dataSource]!,
    };

const _$DataSourceEnumMap = {
  DataSource.network: 'network',
  DataSource.cache: 'cache',
};
