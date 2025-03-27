// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArticlesState {

 List<Article> get data; DateTime? get lastRetrievedTime; DateTime? get shownLastRetrievedTime;
/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticlesStateCopyWith<ArticlesState> get copyWith => _$ArticlesStateCopyWithImpl<ArticlesState>(this as ArticlesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticlesState&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.lastRetrievedTime, lastRetrievedTime) || other.lastRetrievedTime == lastRetrievedTime)&&(identical(other.shownLastRetrievedTime, shownLastRetrievedTime) || other.shownLastRetrievedTime == shownLastRetrievedTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),lastRetrievedTime,shownLastRetrievedTime);

@override
String toString() {
  return 'ArticlesState(data: $data, lastRetrievedTime: $lastRetrievedTime, shownLastRetrievedTime: $shownLastRetrievedTime)';
}


}

/// @nodoc
abstract mixin class $ArticlesStateCopyWith<$Res>  {
  factory $ArticlesStateCopyWith(ArticlesState value, $Res Function(ArticlesState) _then) = _$ArticlesStateCopyWithImpl;
@useResult
$Res call({
 List<Article> data, DateTime? lastRetrievedTime, DateTime? shownLastRetrievedTime
});




}
/// @nodoc
class _$ArticlesStateCopyWithImpl<$Res>
    implements $ArticlesStateCopyWith<$Res> {
  _$ArticlesStateCopyWithImpl(this._self, this._then);

  final ArticlesState _self;
  final $Res Function(ArticlesState) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? lastRetrievedTime = freezed,Object? shownLastRetrievedTime = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,lastRetrievedTime: freezed == lastRetrievedTime ? _self.lastRetrievedTime : lastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,shownLastRetrievedTime: freezed == shownLastRetrievedTime ? _self.shownLastRetrievedTime : shownLastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class IdleArticlesState implements ArticlesState {
  const IdleArticlesState({required final  List<Article> data, required this.lastRetrievedTime, required this.shownLastRetrievedTime}): _data = data;
  

 final  List<Article> _data;
@override List<Article> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  DateTime? lastRetrievedTime;
@override final  DateTime? shownLastRetrievedTime;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdleArticlesStateCopyWith<IdleArticlesState> get copyWith => _$IdleArticlesStateCopyWithImpl<IdleArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleArticlesState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.lastRetrievedTime, lastRetrievedTime) || other.lastRetrievedTime == lastRetrievedTime)&&(identical(other.shownLastRetrievedTime, shownLastRetrievedTime) || other.shownLastRetrievedTime == shownLastRetrievedTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),lastRetrievedTime,shownLastRetrievedTime);

@override
String toString() {
  return 'ArticlesState._idle(data: $data, lastRetrievedTime: $lastRetrievedTime, shownLastRetrievedTime: $shownLastRetrievedTime)';
}


}

/// @nodoc
abstract mixin class $IdleArticlesStateCopyWith<$Res> implements $ArticlesStateCopyWith<$Res> {
  factory $IdleArticlesStateCopyWith(IdleArticlesState value, $Res Function(IdleArticlesState) _then) = _$IdleArticlesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Article> data, DateTime? lastRetrievedTime, DateTime? shownLastRetrievedTime
});




}
/// @nodoc
class _$IdleArticlesStateCopyWithImpl<$Res>
    implements $IdleArticlesStateCopyWith<$Res> {
  _$IdleArticlesStateCopyWithImpl(this._self, this._then);

  final IdleArticlesState _self;
  final $Res Function(IdleArticlesState) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? lastRetrievedTime = freezed,Object? shownLastRetrievedTime = freezed,}) {
  return _then(IdleArticlesState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,lastRetrievedTime: freezed == lastRetrievedTime ? _self.lastRetrievedTime : lastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,shownLastRetrievedTime: freezed == shownLastRetrievedTime ? _self.shownLastRetrievedTime : shownLastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class ProcessingArticlesState implements ArticlesState {
  const ProcessingArticlesState({required final  List<Article> data, required this.lastRetrievedTime, required this.shownLastRetrievedTime}): _data = data;
  

 final  List<Article> _data;
@override List<Article> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  DateTime? lastRetrievedTime;
@override final  DateTime? shownLastRetrievedTime;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessingArticlesStateCopyWith<ProcessingArticlesState> get copyWith => _$ProcessingArticlesStateCopyWithImpl<ProcessingArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingArticlesState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.lastRetrievedTime, lastRetrievedTime) || other.lastRetrievedTime == lastRetrievedTime)&&(identical(other.shownLastRetrievedTime, shownLastRetrievedTime) || other.shownLastRetrievedTime == shownLastRetrievedTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),lastRetrievedTime,shownLastRetrievedTime);

@override
String toString() {
  return 'ArticlesState._processing(data: $data, lastRetrievedTime: $lastRetrievedTime, shownLastRetrievedTime: $shownLastRetrievedTime)';
}


}

/// @nodoc
abstract mixin class $ProcessingArticlesStateCopyWith<$Res> implements $ArticlesStateCopyWith<$Res> {
  factory $ProcessingArticlesStateCopyWith(ProcessingArticlesState value, $Res Function(ProcessingArticlesState) _then) = _$ProcessingArticlesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Article> data, DateTime? lastRetrievedTime, DateTime? shownLastRetrievedTime
});




}
/// @nodoc
class _$ProcessingArticlesStateCopyWithImpl<$Res>
    implements $ProcessingArticlesStateCopyWith<$Res> {
  _$ProcessingArticlesStateCopyWithImpl(this._self, this._then);

  final ProcessingArticlesState _self;
  final $Res Function(ProcessingArticlesState) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? lastRetrievedTime = freezed,Object? shownLastRetrievedTime = freezed,}) {
  return _then(ProcessingArticlesState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,lastRetrievedTime: freezed == lastRetrievedTime ? _self.lastRetrievedTime : lastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,shownLastRetrievedTime: freezed == shownLastRetrievedTime ? _self.shownLastRetrievedTime : shownLastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class NotificationArticlesState implements ArticlesState {
  const NotificationArticlesState({required final  List<Article> data, required this.lastRetrievedTime, required this.shownLastRetrievedTime, required this.message}): _data = data;
  

 final  List<Article> _data;
@override List<Article> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  DateTime? lastRetrievedTime;
@override final  DateTime? shownLastRetrievedTime;
 final  DataProcessingMessage message;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationArticlesStateCopyWith<NotificationArticlesState> get copyWith => _$NotificationArticlesStateCopyWithImpl<NotificationArticlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationArticlesState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.lastRetrievedTime, lastRetrievedTime) || other.lastRetrievedTime == lastRetrievedTime)&&(identical(other.shownLastRetrievedTime, shownLastRetrievedTime) || other.shownLastRetrievedTime == shownLastRetrievedTime)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),lastRetrievedTime,shownLastRetrievedTime,message);

@override
String toString() {
  return 'ArticlesState._notification(data: $data, lastRetrievedTime: $lastRetrievedTime, shownLastRetrievedTime: $shownLastRetrievedTime, message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationArticlesStateCopyWith<$Res> implements $ArticlesStateCopyWith<$Res> {
  factory $NotificationArticlesStateCopyWith(NotificationArticlesState value, $Res Function(NotificationArticlesState) _then) = _$NotificationArticlesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Article> data, DateTime? lastRetrievedTime, DateTime? shownLastRetrievedTime, DataProcessingMessage message
});




}
/// @nodoc
class _$NotificationArticlesStateCopyWithImpl<$Res>
    implements $NotificationArticlesStateCopyWith<$Res> {
  _$NotificationArticlesStateCopyWithImpl(this._self, this._then);

  final NotificationArticlesState _self;
  final $Res Function(NotificationArticlesState) _then;

/// Create a copy of ArticlesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? lastRetrievedTime = freezed,Object? shownLastRetrievedTime = freezed,Object? message = null,}) {
  return _then(NotificationArticlesState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,lastRetrievedTime: freezed == lastRetrievedTime ? _self.lastRetrievedTime : lastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,shownLastRetrievedTime: freezed == shownLastRetrievedTime ? _self.shownLastRetrievedTime : shownLastRetrievedTime // ignore: cast_nullable_to_non_nullable
as DateTime?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as DataProcessingMessage,
  ));
}


}

// dart format on
