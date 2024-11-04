// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return _Guest.fromJson(json);
}

/// @nodoc
mixin _$Guest {
  int get id => throw _privateConstructorUsedError;
  GuestAttributes get attributes => throw _privateConstructorUsedError;

  /// Serializes this Guest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call({int id, GuestAttributes attributes});

  $GuestAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as GuestAttributes,
    ) as $Val);
  }

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GuestAttributesCopyWith<$Res> get attributes {
    return $GuestAttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestImplCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$GuestImplCopyWith(
          _$GuestImpl value, $Res Function(_$GuestImpl) then) =
      __$$GuestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, GuestAttributes attributes});

  @override
  $GuestAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$GuestImplCopyWithImpl<$Res>
    extends _$GuestCopyWithImpl<$Res, _$GuestImpl>
    implements _$$GuestImplCopyWith<$Res> {
  __$$GuestImplCopyWithImpl(
      _$GuestImpl _value, $Res Function(_$GuestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
  }) {
    return _then(_$GuestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as GuestAttributes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestImpl extends _Guest {
  const _$GuestImpl({required this.id, required this.attributes}) : super._();

  factory _$GuestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestImplFromJson(json);

  @override
  final int id;
  @override
  final GuestAttributes attributes;

  @override
  String toString() {
    return 'Guest(id: $id, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, attributes);

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      __$$GuestImplCopyWithImpl<_$GuestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestImplToJson(
      this,
    );
  }
}

abstract class _Guest extends Guest {
  const factory _Guest(
      {required final int id,
      required final GuestAttributes attributes}) = _$GuestImpl;
  const _Guest._() : super._();

  factory _Guest.fromJson(Map<String, dynamic> json) = _$GuestImpl.fromJson;

  @override
  int get id;
  @override
  GuestAttributes get attributes;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
