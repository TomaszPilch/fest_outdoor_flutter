// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketLog {

 int get id; String get code; DateTime get scanTime;
/// Create a copy of TicketLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketLogCopyWith<TicketLog> get copyWith => _$TicketLogCopyWithImpl<TicketLog>(this as TicketLog, _$identity);

  /// Serializes this TicketLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TicketLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketLog&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.scanTime, _this.scanTime) || other.scanTime == _this.scanTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TicketLog;
  return Object.hash(runtimeType,_this.id,_this.code,_this.scanTime);
}

@override
String toString() {
  final _this = this as TicketLog;
  return 'TicketLog(id: ${_this.id}, code: ${_this.code}, scanTime: ${_this.scanTime})';
}


}

/// @nodoc
abstract mixin class $TicketLogCopyWith<$Res>  {
  factory $TicketLogCopyWith(TicketLog value, $Res Function(TicketLog) _then) = _$TicketLogCopyWithImpl;
@useResult
$Res call({
 int id, String code, DateTime scanTime
});




}
/// @nodoc
class _$TicketLogCopyWithImpl<$Res>
    implements $TicketLogCopyWith<$Res> {
  _$TicketLogCopyWithImpl(this._self, this._then);

  final TicketLog _self;
  final $Res Function(TicketLog) _then;

/// Create a copy of TicketLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? scanTime = null,}) {
  return _then(TicketLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,scanTime: null == scanTime ? _self.scanTime : scanTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketLog].
extension TicketLogPatterns on TicketLog {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketLog() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketLog value)  $default,){
final _that = this;
switch (_that) {
case _TicketLog():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketLog value)?  $default,){
final _that = this;
switch (_that) {
case _TicketLog() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  DateTime scanTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketLog() when $default != null:
return $default(_that.id,_that.code,_that.scanTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  DateTime scanTime)  $default,) {final _that = this;
switch (_that) {
case _TicketLog():
return $default(_that.id,_that.code,_that.scanTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  DateTime scanTime)?  $default,) {final _that = this;
switch (_that) {
case _TicketLog() when $default != null:
return $default(_that.id,_that.code,_that.scanTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketLog implements TicketLog {
  const _TicketLog({required this.id, required this.code, required this.scanTime});
  factory _TicketLog.fromJson(Map<String, dynamic> json) => _$TicketLogFromJson(json);

@override final  int id;
@override final  String code;
@override final  DateTime scanTime;

/// Create a copy of TicketLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketLogCopyWith<_TicketLog> get copyWith => __$TicketLogCopyWithImpl<_TicketLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketLog&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.scanTime, scanTime) || other.scanTime == scanTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,scanTime);
}

@override
String toString() {
    return 'TicketLog(id: $id, code: $code, scanTime: $scanTime)';
}


}

/// @nodoc
abstract mixin class _$TicketLogCopyWith<$Res> implements $TicketLogCopyWith<$Res> {
  factory _$TicketLogCopyWith(_TicketLog value, $Res Function(_TicketLog) _then) = __$TicketLogCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, DateTime scanTime
});




}
/// @nodoc
class __$TicketLogCopyWithImpl<$Res>
    implements _$TicketLogCopyWith<$Res> {
  __$TicketLogCopyWithImpl(this._self, this._then);

  final _TicketLog _self;
  final $Res Function(_TicketLog) _then;

/// Create a copy of TicketLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? scanTime = null,}) {
  return _then(_TicketLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,scanTime: null == scanTime ? _self.scanTime : scanTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
