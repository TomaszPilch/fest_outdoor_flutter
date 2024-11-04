// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_attributes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GuestAttributes _$GuestAttributesFromJson(Map<String, dynamic> json) {
  return _GuestAttributes.fromJson(json);
}

/// @nodoc
mixin _$GuestAttributes {
  String get title => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get content => throw _privateConstructorUsedError;
  Image? get image => throw _privateConstructorUsedError;

  /// Serializes this GuestAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestAttributesCopyWith<GuestAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestAttributesCopyWith<$Res> {
  factory $GuestAttributesCopyWith(
          GuestAttributes value, $Res Function(GuestAttributes) then) =
      _$GuestAttributesCopyWithImpl<$Res, GuestAttributes>;
  @useResult
  $Res call(
      {String title,
      DateTime start,
      DateTime end,
      String description,
      List<Map<String, dynamic>> content,
      Image? image});

  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$GuestAttributesCopyWithImpl<$Res, $Val extends GuestAttributes>
    implements $GuestAttributesCopyWith<$Res> {
  _$GuestAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? description = null,
    Object? content = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ) as $Val);
  }

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestAttributesImplCopyWith<$Res>
    implements $GuestAttributesCopyWith<$Res> {
  factory _$$GuestAttributesImplCopyWith(_$GuestAttributesImpl value,
          $Res Function(_$GuestAttributesImpl) then) =
      __$$GuestAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DateTime start,
      DateTime end,
      String description,
      List<Map<String, dynamic>> content,
      Image? image});

  @override
  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$GuestAttributesImplCopyWithImpl<$Res>
    extends _$GuestAttributesCopyWithImpl<$Res, _$GuestAttributesImpl>
    implements _$$GuestAttributesImplCopyWith<$Res> {
  __$$GuestAttributesImplCopyWithImpl(
      _$GuestAttributesImpl _value, $Res Function(_$GuestAttributesImpl) _then)
      : super(_value, _then);

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? description = null,
    Object? content = null,
    Object? image = freezed,
  }) {
    return _then(_$GuestAttributesImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestAttributesImpl implements _GuestAttributes {
  const _$GuestAttributesImpl(
      {required this.title,
      required this.start,
      required this.end,
      required this.description,
      required final List<Map<String, dynamic>> content,
      this.image})
      : _content = content;

  factory _$GuestAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestAttributesImplFromJson(json);

  @override
  final String title;
  @override
  final DateTime start;
  @override
  final DateTime end;
  @override
  final String description;
  final List<Map<String, dynamic>> _content;
  @override
  List<Map<String, dynamic>> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Image? image;

  @override
  String toString() {
    return 'GuestAttributes(title: $title, start: $start, end: $end, description: $description, content: $content, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestAttributesImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, start, end, description,
      const DeepCollectionEquality().hash(_content), image);

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestAttributesImplCopyWith<_$GuestAttributesImpl> get copyWith =>
      __$$GuestAttributesImplCopyWithImpl<_$GuestAttributesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestAttributesImplToJson(
      this,
    );
  }
}

abstract class _GuestAttributes implements GuestAttributes {
  const factory _GuestAttributes(
      {required final String title,
      required final DateTime start,
      required final DateTime end,
      required final String description,
      required final List<Map<String, dynamic>> content,
      final Image? image}) = _$GuestAttributesImpl;

  factory _GuestAttributes.fromJson(Map<String, dynamic> json) =
      _$GuestAttributesImpl.fromJson;

  @override
  String get title;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  String get description;
  @override
  List<Map<String, dynamic>> get content;
  @override
  Image? get image;

  /// Create a copy of GuestAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestAttributesImplCopyWith<_$GuestAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
