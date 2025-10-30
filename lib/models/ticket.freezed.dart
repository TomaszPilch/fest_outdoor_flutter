// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ticket {
  int get id;
  String get code;
  String get name;
  String? get email;
  String? get person;
  List<TicketLog>? get logs;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TicketCopyWith<Ticket> get copyWith =>
      _$TicketCopyWithImpl<Ticket>(this as Ticket, _$identity);

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ticket &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.person, person) || other.person == person) &&
            const DeepCollectionEquality().equals(other.logs, logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, email, person,
      const DeepCollectionEquality().hash(logs));

  @override
  String toString() {
    return 'Ticket(id: $id, code: $code, name: $name, email: $email, person: $person, logs: $logs)';
  }
}

/// @nodoc
abstract mixin class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) _then) =
      _$TicketCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      String? email,
      String? person,
      List<TicketLog>? logs});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res> implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._self, this._then);

  final Ticket _self;
  final $Res Function(Ticket) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? email = freezed,
    Object? person = freezed,
    Object? logs = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      person: freezed == person
          ? _self.person
          : person // ignore: cast_nullable_to_non_nullable
              as String?,
      logs: freezed == logs
          ? _self.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<TicketLog>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Ticket].
extension TicketPatterns on Ticket {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Ticket value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ticket() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Ticket value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ticket():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Ticket value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ticket() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String code, String name, String? email,
            String? person, List<TicketLog>? logs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Ticket() when $default != null:
        return $default(_that.id, _that.code, _that.name, _that.email,
            _that.person, _that.logs);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String code, String name, String? email,
            String? person, List<TicketLog>? logs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ticket():
        return $default(_that.id, _that.code, _that.name, _that.email,
            _that.person, _that.logs);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String code, String name, String? email,
            String? person, List<TicketLog>? logs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Ticket() when $default != null:
        return $default(_that.id, _that.code, _that.name, _that.email,
            _that.person, _that.logs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Ticket implements Ticket {
  const _Ticket(
      {required this.id,
      required this.code,
      required this.name,
      this.email,
      this.person,
      final List<TicketLog>? logs})
      : _logs = logs;
  factory _Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? person;
  final List<TicketLog>? _logs;
  @override
  List<TicketLog>? get logs {
    final value = _logs;
    if (value == null) return null;
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TicketCopyWith<_Ticket> get copyWith =>
      __$TicketCopyWithImpl<_Ticket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TicketToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ticket &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.person, person) || other.person == person) &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, email, person,
      const DeepCollectionEquality().hash(_logs));

  @override
  String toString() {
    return 'Ticket(id: $id, code: $code, name: $name, email: $email, person: $person, logs: $logs)';
  }
}

/// @nodoc
abstract mixin class _$TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$TicketCopyWith(_Ticket value, $Res Function(_Ticket) _then) =
      __$TicketCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      String name,
      String? email,
      String? person,
      List<TicketLog>? logs});
}

/// @nodoc
class __$TicketCopyWithImpl<$Res> implements _$TicketCopyWith<$Res> {
  __$TicketCopyWithImpl(this._self, this._then);

  final _Ticket _self;
  final $Res Function(_Ticket) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? email = freezed,
    Object? person = freezed,
    Object? logs = freezed,
  }) {
    return _then(_Ticket(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      person: freezed == person
          ? _self.person
          : person // ignore: cast_nullable_to_non_nullable
              as String?,
      logs: freezed == logs
          ? _self._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<TicketLog>?,
    ));
  }
}

// dart format on
