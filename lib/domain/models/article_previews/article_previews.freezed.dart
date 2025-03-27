// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_previews.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticlePreviews {

 ReceptionDetails get receptionDetails; List<Article> get data;
/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticlePreviewsCopyWith<ArticlePreviews> get copyWith => _$ArticlePreviewsCopyWithImpl<ArticlePreviews>(this as ArticlePreviews, _$identity);

  /// Serializes this ArticlePreviews to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticlePreviews&&(identical(other.receptionDetails, receptionDetails) || other.receptionDetails == receptionDetails)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receptionDetails,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ArticlePreviews(receptionDetails: $receptionDetails, data: $data)';
}


}

/// @nodoc
abstract mixin class $ArticlePreviewsCopyWith<$Res>  {
  factory $ArticlePreviewsCopyWith(ArticlePreviews value, $Res Function(ArticlePreviews) _then) = _$ArticlePreviewsCopyWithImpl;
@useResult
$Res call({
 ReceptionDetails receptionDetails, List<Article> data
});


$ReceptionDetailsCopyWith<$Res> get receptionDetails;

}
/// @nodoc
class _$ArticlePreviewsCopyWithImpl<$Res>
    implements $ArticlePreviewsCopyWith<$Res> {
  _$ArticlePreviewsCopyWithImpl(this._self, this._then);

  final ArticlePreviews _self;
  final $Res Function(ArticlePreviews) _then;

/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receptionDetails = null,Object? data = null,}) {
  return _then(_self.copyWith(
receptionDetails: null == receptionDetails ? _self.receptionDetails : receptionDetails // ignore: cast_nullable_to_non_nullable
as ReceptionDetails,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}
/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceptionDetailsCopyWith<$Res> get receptionDetails {
  
  return $ReceptionDetailsCopyWith<$Res>(_self.receptionDetails, (value) {
    return _then(_self.copyWith(receptionDetails: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ArticlePreviews extends ArticlePreviews {
  const _ArticlePreviews({required this.receptionDetails, required final  List<Article> data}): _data = data,super._();
  factory _ArticlePreviews.fromJson(Map<String, dynamic> json) => _$ArticlePreviewsFromJson(json);

@override final  ReceptionDetails receptionDetails;
 final  List<Article> _data;
@override List<Article> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticlePreviewsCopyWith<_ArticlePreviews> get copyWith => __$ArticlePreviewsCopyWithImpl<_ArticlePreviews>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticlePreviewsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticlePreviews&&(identical(other.receptionDetails, receptionDetails) || other.receptionDetails == receptionDetails)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receptionDetails,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ArticlePreviews(receptionDetails: $receptionDetails, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ArticlePreviewsCopyWith<$Res> implements $ArticlePreviewsCopyWith<$Res> {
  factory _$ArticlePreviewsCopyWith(_ArticlePreviews value, $Res Function(_ArticlePreviews) _then) = __$ArticlePreviewsCopyWithImpl;
@override @useResult
$Res call({
 ReceptionDetails receptionDetails, List<Article> data
});


@override $ReceptionDetailsCopyWith<$Res> get receptionDetails;

}
/// @nodoc
class __$ArticlePreviewsCopyWithImpl<$Res>
    implements _$ArticlePreviewsCopyWith<$Res> {
  __$ArticlePreviewsCopyWithImpl(this._self, this._then);

  final _ArticlePreviews _self;
  final $Res Function(_ArticlePreviews) _then;

/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receptionDetails = null,Object? data = null,}) {
  return _then(_ArticlePreviews(
receptionDetails: null == receptionDetails ? _self.receptionDetails : receptionDetails // ignore: cast_nullable_to_non_nullable
as ReceptionDetails,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}

/// Create a copy of ArticlePreviews
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceptionDetailsCopyWith<$Res> get receptionDetails {
  
  return $ReceptionDetailsCopyWith<$Res>(_self.receptionDetails, (value) {
    return _then(_self.copyWith(receptionDetails: value));
  });
}
}

// dart format on
