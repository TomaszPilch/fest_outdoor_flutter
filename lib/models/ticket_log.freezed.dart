// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketLog _$TicketLogFromJson(Map<String, dynamic> json) {
  return _TicketLog.fromJson(json);
}

/// @nodoc
mixin _$TicketLog {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  DateTime get scanTime => throw _privateConstructorUsedError;

  /// Serializes this TicketLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketLogCopyWith<TicketLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketLogCopyWith<$Res> {
  factory $TicketLogCopyWith(TicketLog value, $Res Function(TicketLog) then) =
      _$TicketLogCopyWithImpl<$Res, TicketLog>;
  @useResult
  $Res call({int id, String code, DateTime scanTime});
}

/// @nodoc
class _$TicketLogCopyWithImpl<$Res, $Val extends TicketLog>
    implements $TicketLogCopyWith<$Res> {
  _$TicketLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? scanTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      scanTime: null == scanTime
          ? _value.scanTime
          : scanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketLogImplCopyWith<$Res>
    implements $TicketLogCopyWith<$Res> {
  factory _$$TicketLogImplCopyWith(
          _$TicketLogImpl value, $Res Function(_$TicketLogImpl) then) =
      __$$TicketLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String code, DateTime scanTime});
}

/// @nodoc
class __$$TicketLogImplCopyWithImpl<$Res>
    extends _$TicketLogCopyWithImpl<$Res, _$TicketLogImpl>
    implements _$$TicketLogImplCopyWith<$Res> {
  __$$TicketLogImplCopyWithImpl(
      _$TicketLogImpl _value, $Res Function(_$TicketLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? scanTime = null,
  }) {
    return _then(_$TicketLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      scanTime: null == scanTime
          ? _value.scanTime
          : scanTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketLogImpl implements _TicketLog {
  const _$TicketLogImpl(
      {required this.id, required this.code, required this.scanTime});

  factory _$TicketLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketLogImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final DateTime scanTime;

  @override
  String toString() {
    return 'TicketLog(id: $id, code: $code, scanTime: $scanTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.scanTime, scanTime) ||
                other.scanTime == scanTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, scanTime);

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketLogImplCopyWith<_$TicketLogImpl> get copyWith =>
      __$$TicketLogImplCopyWithImpl<_$TicketLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketLogImplToJson(
      this,
    );
  }
}

abstract class _TicketLog implements TicketLog {
  const factory _TicketLog(
      {required final int id,
      required final String code,
      required final DateTime scanTime}) = _$TicketLogImpl;

  factory _TicketLog.fromJson(Map<String, dynamic> json) =
      _$TicketLogImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  DateTime get scanTime;

  /// Create a copy of TicketLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketLogImplCopyWith<_$TicketLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
