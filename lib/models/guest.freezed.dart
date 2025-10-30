// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Guest {
  int get id;
  String get title;
  DateTime get start;
  DateTime get end;
  String get description;
  List<Map<String, dynamic>> get content;
  Image? get image;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GuestCopyWith<Guest> get copyWith =>
      _$GuestCopyWithImpl<Guest>(this as Guest, _$identity);

  /// Serializes this Guest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Guest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, start, end,
      description, const DeepCollectionEquality().hash(content), image);

  @override
  String toString() {
    return 'Guest(id: $id, title: $title, start: $start, end: $end, description: $description, content: $content, image: $image)';
  }
}

/// @nodoc
abstract mixin class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) _then) =
      _$GuestCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime start,
      DateTime end,
      String description,
      List<Map<String, dynamic>> content,
      Image? image});

  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$GuestCopyWithImpl<$Res> implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._self, this._then);

  final Guest _self;
  final $Res Function(Guest) _then;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? description = null,
    Object? content = null,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Guest].
extension GuestPatterns on Guest {
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
    TResult Function(_Guest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Guest() when $default != null:
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
    TResult Function(_Guest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Guest():
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
    TResult? Function(_Guest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Guest() when $default != null:
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
    TResult Function(
            int id,
            String title,
            DateTime start,
            DateTime end,
            String description,
            List<Map<String, dynamic>> content,
            Image? image)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Guest() when $default != null:
        return $default(_that.id, _that.title, _that.start, _that.end,
            _that.description, _that.content, _that.image);
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
    TResult Function(
            int id,
            String title,
            DateTime start,
            DateTime end,
            String description,
            List<Map<String, dynamic>> content,
            Image? image)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Guest():
        return $default(_that.id, _that.title, _that.start, _that.end,
            _that.description, _that.content, _that.image);
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
    TResult? Function(
            int id,
            String title,
            DateTime start,
            DateTime end,
            String description,
            List<Map<String, dynamic>> content,
            Image? image)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Guest() when $default != null:
        return $default(_that.id, _that.title, _that.start, _that.end,
            _that.description, _that.content, _that.image);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Guest extends Guest {
  const _Guest(
      {required this.id,
      required this.title,
      required this.start,
      required this.end,
      required this.description,
      required final List<Map<String, dynamic>> content,
      this.image})
      : _content = content,
        super._();
  factory _Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  @override
  final int id;
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

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GuestCopyWith<_Guest> get copyWith =>
      __$GuestCopyWithImpl<_Guest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GuestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Guest &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(runtimeType, id, title, start, end,
      description, const DeepCollectionEquality().hash(_content), image);

  @override
  String toString() {
    return 'Guest(id: $id, title: $title, start: $start, end: $end, description: $description, content: $content, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$GuestCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$GuestCopyWith(_Guest value, $Res Function(_Guest) _then) =
      __$GuestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      DateTime start,
      DateTime end,
      String description,
      List<Map<String, dynamic>> content,
      Image? image});

  @override
  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$GuestCopyWithImpl<$Res> implements _$GuestCopyWith<$Res> {
  __$GuestCopyWithImpl(this._self, this._then);

  final _Guest _self;
  final $Res Function(_Guest) _then;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = null,
    Object? end = null,
    Object? description = null,
    Object? content = null,
    Object? image = freezed,
  }) {
    return _then(_Guest(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get image {
    if (_self.image == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_self.image!, (value) {
      return _then(_self.copyWith(image: value));
    });
  }
}

// dart format on
