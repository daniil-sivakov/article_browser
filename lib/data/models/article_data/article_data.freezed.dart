// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleData {

 int get id; int get userId; String get title; String get body;
/// Create a copy of ArticleData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleDataCopyWith<ArticleData> get copyWith => _$ArticleDataCopyWithImpl<ArticleData>(this as ArticleData, _$identity);

  /// Serializes this ArticleData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body);

@override
String toString() {
  return 'ArticleData(id: $id, userId: $userId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class $ArticleDataCopyWith<$Res>  {
  factory $ArticleDataCopyWith(ArticleData value, $Res Function(ArticleData) _then) = _$ArticleDataCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String title, String body
});




}
/// @nodoc
class _$ArticleDataCopyWithImpl<$Res>
    implements $ArticleDataCopyWith<$Res> {
  _$ArticleDataCopyWithImpl(this._self, this._then);

  final ArticleData _self;
  final $Res Function(ArticleData) _then;

/// Create a copy of ArticleData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? body = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ArticleData implements ArticleData {
  const _ArticleData({required this.id, required this.userId, required this.title, required this.body});
  factory _ArticleData.fromJson(Map<String, dynamic> json) => _$ArticleDataFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String title;
@override final  String body;

/// Create a copy of ArticleData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleDataCopyWith<_ArticleData> get copyWith => __$ArticleDataCopyWithImpl<_ArticleData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body);

@override
String toString() {
  return 'ArticleData(id: $id, userId: $userId, title: $title, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ArticleDataCopyWith<$Res> implements $ArticleDataCopyWith<$Res> {
  factory _$ArticleDataCopyWith(_ArticleData value, $Res Function(_ArticleData) _then) = __$ArticleDataCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String title, String body
});




}
/// @nodoc
class __$ArticleDataCopyWithImpl<$Res>
    implements _$ArticleDataCopyWith<$Res> {
  __$ArticleDataCopyWithImpl(this._self, this._then);

  final _ArticleData _self;
  final $Res Function(_ArticleData) _then;

/// Create a copy of ArticleData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? body = null,}) {
  return _then(_ArticleData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
