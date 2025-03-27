// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reception_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceptionDetails {

 DateTime get dataReceivedAt; DataSource get dataSource;
/// Create a copy of ReceptionDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceptionDetailsCopyWith<ReceptionDetails> get copyWith => _$ReceptionDetailsCopyWithImpl<ReceptionDetails>(this as ReceptionDetails, _$identity);

  /// Serializes this ReceptionDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceptionDetails&&(identical(other.dataReceivedAt, dataReceivedAt) || other.dataReceivedAt == dataReceivedAt)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataReceivedAt,dataSource);

@override
String toString() {
  return 'ReceptionDetails(dataReceivedAt: $dataReceivedAt, dataSource: $dataSource)';
}


}

/// @nodoc
abstract mixin class $ReceptionDetailsCopyWith<$Res>  {
  factory $ReceptionDetailsCopyWith(ReceptionDetails value, $Res Function(ReceptionDetails) _then) = _$ReceptionDetailsCopyWithImpl;
@useResult
$Res call({
 DateTime dataReceivedAt, DataSource dataSource
});




}
/// @nodoc
class _$ReceptionDetailsCopyWithImpl<$Res>
    implements $ReceptionDetailsCopyWith<$Res> {
  _$ReceptionDetailsCopyWithImpl(this._self, this._then);

  final ReceptionDetails _self;
  final $Res Function(ReceptionDetails) _then;

/// Create a copy of ReceptionDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataReceivedAt = null,Object? dataSource = null,}) {
  return _then(_self.copyWith(
dataReceivedAt: null == dataReceivedAt ? _self.dataReceivedAt : dataReceivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dataSource: null == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as DataSource,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReceptionDetails extends ReceptionDetails {
  const _ReceptionDetails({required this.dataReceivedAt, required this.dataSource}): super._();
  factory _ReceptionDetails.fromJson(Map<String, dynamic> json) => _$ReceptionDetailsFromJson(json);

@override final  DateTime dataReceivedAt;
@override final  DataSource dataSource;

/// Create a copy of ReceptionDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceptionDetailsCopyWith<_ReceptionDetails> get copyWith => __$ReceptionDetailsCopyWithImpl<_ReceptionDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceptionDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceptionDetails&&(identical(other.dataReceivedAt, dataReceivedAt) || other.dataReceivedAt == dataReceivedAt)&&(identical(other.dataSource, dataSource) || other.dataSource == dataSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataReceivedAt,dataSource);

@override
String toString() {
  return 'ReceptionDetails(dataReceivedAt: $dataReceivedAt, dataSource: $dataSource)';
}


}

/// @nodoc
abstract mixin class _$ReceptionDetailsCopyWith<$Res> implements $ReceptionDetailsCopyWith<$Res> {
  factory _$ReceptionDetailsCopyWith(_ReceptionDetails value, $Res Function(_ReceptionDetails) _then) = __$ReceptionDetailsCopyWithImpl;
@override @useResult
$Res call({
 DateTime dataReceivedAt, DataSource dataSource
});




}
/// @nodoc
class __$ReceptionDetailsCopyWithImpl<$Res>
    implements _$ReceptionDetailsCopyWith<$Res> {
  __$ReceptionDetailsCopyWithImpl(this._self, this._then);

  final _ReceptionDetails _self;
  final $Res Function(_ReceptionDetails) _then;

/// Create a copy of ReceptionDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataReceivedAt = null,Object? dataSource = null,}) {
  return _then(_ReceptionDetails(
dataReceivedAt: null == dataReceivedAt ? _self.dataReceivedAt : dataReceivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dataSource: null == dataSource ? _self.dataSource : dataSource // ignore: cast_nullable_to_non_nullable
as DataSource,
  ));
}


}

// dart format on
