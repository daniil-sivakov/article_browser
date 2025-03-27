// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArticleDetailsState {

 Article? get article; List<Comment> get comments; bool get noDataFound;
/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleDetailsStateCopyWith<ArticleDetailsState> get copyWith => _$ArticleDetailsStateCopyWithImpl<ArticleDetailsState>(this as ArticleDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleDetailsState&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.noDataFound, noDataFound) || other.noDataFound == noDataFound));
}


@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(comments),noDataFound);

@override
String toString() {
  return 'ArticleDetailsState(article: $article, comments: $comments, noDataFound: $noDataFound)';
}


}

/// @nodoc
abstract mixin class $ArticleDetailsStateCopyWith<$Res>  {
  factory $ArticleDetailsStateCopyWith(ArticleDetailsState value, $Res Function(ArticleDetailsState) _then) = _$ArticleDetailsStateCopyWithImpl;
@useResult
$Res call({
 Article? article, List<Comment> comments, bool noDataFound
});


$ArticleCopyWith<$Res>? get article;

}
/// @nodoc
class _$ArticleDetailsStateCopyWithImpl<$Res>
    implements $ArticleDetailsStateCopyWith<$Res> {
  _$ArticleDetailsStateCopyWithImpl(this._self, this._then);

  final ArticleDetailsState _self;
  final $Res Function(ArticleDetailsState) _then;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? article = freezed,Object? comments = null,Object? noDataFound = null,}) {
  return _then(_self.copyWith(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,noDataFound: null == noDataFound ? _self.noDataFound : noDataFound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $ArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}


/// @nodoc


class IdleArticleDetailsState implements ArticleDetailsState {
  const IdleArticleDetailsState({required this.article, required final  List<Comment> comments, required this.noDataFound}): _comments = comments;
  

@override final  Article? article;
 final  List<Comment> _comments;
@override List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  bool noDataFound;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdleArticleDetailsStateCopyWith<IdleArticleDetailsState> get copyWith => _$IdleArticleDetailsStateCopyWithImpl<IdleArticleDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleArticleDetailsState&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.noDataFound, noDataFound) || other.noDataFound == noDataFound));
}


@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(_comments),noDataFound);

@override
String toString() {
  return 'ArticleDetailsState._idle(article: $article, comments: $comments, noDataFound: $noDataFound)';
}


}

/// @nodoc
abstract mixin class $IdleArticleDetailsStateCopyWith<$Res> implements $ArticleDetailsStateCopyWith<$Res> {
  factory $IdleArticleDetailsStateCopyWith(IdleArticleDetailsState value, $Res Function(IdleArticleDetailsState) _then) = _$IdleArticleDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Article? article, List<Comment> comments, bool noDataFound
});


@override $ArticleCopyWith<$Res>? get article;

}
/// @nodoc
class _$IdleArticleDetailsStateCopyWithImpl<$Res>
    implements $IdleArticleDetailsStateCopyWith<$Res> {
  _$IdleArticleDetailsStateCopyWithImpl(this._self, this._then);

  final IdleArticleDetailsState _self;
  final $Res Function(IdleArticleDetailsState) _then;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? article = freezed,Object? comments = null,Object? noDataFound = null,}) {
  return _then(IdleArticleDetailsState(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,noDataFound: null == noDataFound ? _self.noDataFound : noDataFound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $ArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}

/// @nodoc


class ProcessingArticleDetailsState implements ArticleDetailsState {
  const ProcessingArticleDetailsState({required this.article, required final  List<Comment> comments, required this.noDataFound}): _comments = comments;
  

@override final  Article? article;
 final  List<Comment> _comments;
@override List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  bool noDataFound;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessingArticleDetailsStateCopyWith<ProcessingArticleDetailsState> get copyWith => _$ProcessingArticleDetailsStateCopyWithImpl<ProcessingArticleDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingArticleDetailsState&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.noDataFound, noDataFound) || other.noDataFound == noDataFound));
}


@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(_comments),noDataFound);

@override
String toString() {
  return 'ArticleDetailsState._processing(article: $article, comments: $comments, noDataFound: $noDataFound)';
}


}

/// @nodoc
abstract mixin class $ProcessingArticleDetailsStateCopyWith<$Res> implements $ArticleDetailsStateCopyWith<$Res> {
  factory $ProcessingArticleDetailsStateCopyWith(ProcessingArticleDetailsState value, $Res Function(ProcessingArticleDetailsState) _then) = _$ProcessingArticleDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Article? article, List<Comment> comments, bool noDataFound
});


@override $ArticleCopyWith<$Res>? get article;

}
/// @nodoc
class _$ProcessingArticleDetailsStateCopyWithImpl<$Res>
    implements $ProcessingArticleDetailsStateCopyWith<$Res> {
  _$ProcessingArticleDetailsStateCopyWithImpl(this._self, this._then);

  final ProcessingArticleDetailsState _self;
  final $Res Function(ProcessingArticleDetailsState) _then;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? article = freezed,Object? comments = null,Object? noDataFound = null,}) {
  return _then(ProcessingArticleDetailsState(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,noDataFound: null == noDataFound ? _self.noDataFound : noDataFound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $ArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}

/// @nodoc


class NotificationArticleDetailsState implements ArticleDetailsState {
  const NotificationArticleDetailsState({required this.article, required final  List<Comment> comments, required this.noDataFound, required this.message}): _comments = comments;
  

@override final  Article? article;
 final  List<Comment> _comments;
@override List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  bool noDataFound;
 final  DataProcessingMessage message;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationArticleDetailsStateCopyWith<NotificationArticleDetailsState> get copyWith => _$NotificationArticleDetailsStateCopyWithImpl<NotificationArticleDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationArticleDetailsState&&(identical(other.article, article) || other.article == article)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.noDataFound, noDataFound) || other.noDataFound == noDataFound)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,article,const DeepCollectionEquality().hash(_comments),noDataFound,message);

@override
String toString() {
  return 'ArticleDetailsState._notification(article: $article, comments: $comments, noDataFound: $noDataFound, message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationArticleDetailsStateCopyWith<$Res> implements $ArticleDetailsStateCopyWith<$Res> {
  factory $NotificationArticleDetailsStateCopyWith(NotificationArticleDetailsState value, $Res Function(NotificationArticleDetailsState) _then) = _$NotificationArticleDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 Article? article, List<Comment> comments, bool noDataFound, DataProcessingMessage message
});


@override $ArticleCopyWith<$Res>? get article;

}
/// @nodoc
class _$NotificationArticleDetailsStateCopyWithImpl<$Res>
    implements $NotificationArticleDetailsStateCopyWith<$Res> {
  _$NotificationArticleDetailsStateCopyWithImpl(this._self, this._then);

  final NotificationArticleDetailsState _self;
  final $Res Function(NotificationArticleDetailsState) _then;

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? article = freezed,Object? comments = null,Object? noDataFound = null,Object? message = null,}) {
  return _then(NotificationArticleDetailsState(
article: freezed == article ? _self.article : article // ignore: cast_nullable_to_non_nullable
as Article?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,noDataFound: null == noDataFound ? _self.noDataFound : noDataFound // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as DataProcessingMessage,
  ));
}

/// Create a copy of ArticleDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleCopyWith<$Res>? get article {
    if (_self.article == null) {
    return null;
  }

  return $ArticleCopyWith<$Res>(_self.article!, (value) {
    return _then(_self.copyWith(article: value));
  });
}
}

// dart format on
