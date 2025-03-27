// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleDetails {

 ReceptionDetails get receptionDetails; Article get article; List<Comment> get comments;
/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleDetailsCopyWith<ArticleDetails> get copyWith => _$ArticleDetailsCopyWithImpl<ArticleDetails>(this as ArticleDetails, _$identity);

  /// Serializes this ArticleDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleDetails&&(identical(other.receptionDetails, receptionDetails) || other.receptionDetails == receptionDetails)&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receptionDetails,article,const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'ArticleDetails(receptionDetails: $receptionDetails, article: $article, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $ArticleDetailsCopyWith<$Res>  {
  factory $ArticleDetailsCopyWith(ArticleDetails value, $Res Function(ArticleDetails) _then) = _$ArticleDetailsCopyWithImpl;
@useResult
$Res call({
 ReceptionDetails receptionDetails, Article article, List<Comment> comments
});


$ReceptionDetailsCopyWith<$Res> get receptionDetails;$ArticleCopyWith<$Res> get article;

}
/// @nodoc
class _$ArticleDetailsCopyWithImpl<$Res>
    implements $ArticleDetailsCopyWith<$Res> {
  _$ArticleDetailsCopyWithImpl(this._self, this._then);

  final ArticleDetails _self;
  final $Res Function(ArticleDetails) _then;

/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receptionDetails = null,Object? article = null,Object? comments = null,}) {
  return _then(_self.copyWith(
receptionDetails: null == receptionDetails ? _self.receptionDetails : receptionDetails // ignore: cast_nullable_to_non_nullable
as ReceptionDetails,article: null == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,
  ));
}
/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceptionDetailsCopyWith<$Res> get receptionDetails {
  
  return $ReceptionDetailsCopyWith<$Res>(_self.receptionDetails, (value) {
    return _then(_self.copyWith(receptionDetails: value));
  });
}/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res> get article {
  
  return $ArticleCopyWith<$Res>(_self.article, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ArticleDetails extends ArticleDetails {
  const _ArticleDetails({required this.receptionDetails, required this.article, required final  List<Comment> comments}): _comments = comments,super._();
  factory _ArticleDetails.fromJson(Map<String, dynamic> json) => _$ArticleDetailsFromJson(json);

@override final  ReceptionDetails receptionDetails;
@override final  Article article;
 final  List<Comment> _comments;
@override List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleDetailsCopyWith<_ArticleDetails> get copyWith => __$ArticleDetailsCopyWithImpl<_ArticleDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleDetails&&(identical(other.receptionDetails, receptionDetails) || other.receptionDetails == receptionDetails)&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receptionDetails,article,const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'ArticleDetails(receptionDetails: $receptionDetails, article: $article, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$ArticleDetailsCopyWith<$Res> implements $ArticleDetailsCopyWith<$Res> {
  factory _$ArticleDetailsCopyWith(_ArticleDetails value, $Res Function(_ArticleDetails) _then) = __$ArticleDetailsCopyWithImpl;
@override @useResult
$Res call({
 ReceptionDetails receptionDetails, Article article, List<Comment> comments
});


@override $ReceptionDetailsCopyWith<$Res> get receptionDetails;@override $ArticleCopyWith<$Res> get article;

}
/// @nodoc
class __$ArticleDetailsCopyWithImpl<$Res>
    implements _$ArticleDetailsCopyWith<$Res> {
  __$ArticleDetailsCopyWithImpl(this._self, this._then);

  final _ArticleDetails _self;
  final $Res Function(_ArticleDetails) _then;

/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receptionDetails = null,Object? article = null,Object? comments = null,}) {
  return _then(_ArticleDetails(
receptionDetails: null == receptionDetails ? _self.receptionDetails : receptionDetails // ignore: cast_nullable_to_non_nullable
as ReceptionDetails,article: null == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,
  ));
}

/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReceptionDetailsCopyWith<$Res> get receptionDetails {
  
  return $ReceptionDetailsCopyWith<$Res>(_self.receptionDetails, (value) {
    return _then(_self.copyWith(receptionDetails: value));
  });
}/// Create a copy of ArticleDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res> get article {
  
  return $ArticleCopyWith<$Res>(_self.article, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}

// dart format on
