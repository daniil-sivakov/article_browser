// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentData {

 int get postId; int get id; String get name; String get email; String get body;
/// Create a copy of CommentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDataCopyWith<CommentData> get copyWith => _$CommentDataCopyWithImpl<CommentData>(this as CommentData, _$identity);

  /// Serializes this CommentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentData&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,id,name,email,body);

@override
String toString() {
  return 'CommentData(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
}


}

/// @nodoc
abstract mixin class $CommentDataCopyWith<$Res>  {
  factory $CommentDataCopyWith(CommentData value, $Res Function(CommentData) _then) = _$CommentDataCopyWithImpl;
@useResult
$Res call({
 int postId, int id, String name, String email, String body
});




}
/// @nodoc
class _$CommentDataCopyWithImpl<$Res>
    implements $CommentDataCopyWith<$Res> {
  _$CommentDataCopyWithImpl(this._self, this._then);

  final CommentData _self;
  final $Res Function(CommentData) _then;

/// Create a copy of CommentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,Object? id = null,Object? name = null,Object? email = null,Object? body = null,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentData implements CommentData {
  const _CommentData({required this.postId, required this.id, required this.name, required this.email, required this.body});
  factory _CommentData.fromJson(Map<String, dynamic> json) => _$CommentDataFromJson(json);

@override final  int postId;
@override final  int id;
@override final  String name;
@override final  String email;
@override final  String body;

/// Create a copy of CommentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentDataCopyWith<_CommentData> get copyWith => __$CommentDataCopyWithImpl<_CommentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentData&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,id,name,email,body);

@override
String toString() {
  return 'CommentData(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
}


}

/// @nodoc
abstract mixin class _$CommentDataCopyWith<$Res> implements $CommentDataCopyWith<$Res> {
  factory _$CommentDataCopyWith(_CommentData value, $Res Function(_CommentData) _then) = __$CommentDataCopyWithImpl;
@override @useResult
$Res call({
 int postId, int id, String name, String email, String body
});




}
/// @nodoc
class __$CommentDataCopyWithImpl<$Res>
    implements _$CommentDataCopyWith<$Res> {
  __$CommentDataCopyWithImpl(this._self, this._then);

  final _CommentData _self;
  final $Res Function(_CommentData) _then;

/// Create a copy of CommentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? id = null,Object? name = null,Object? email = null,Object? body = null,}) {
  return _then(_CommentData(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
