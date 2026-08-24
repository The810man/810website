// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlatformLink {
  String get name => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;

  /// Create a copy of PlatformLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlatformLinkCopyWith<PlatformLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformLinkCopyWith<$Res> {
  factory $PlatformLinkCopyWith(
          PlatformLink value, $Res Function(PlatformLink) then) =
      _$PlatformLinkCopyWithImpl<$Res, PlatformLink>;
  @useResult
  $Res call(
      {String name, IconData icon, String url, String description, String tag});
}

/// @nodoc
class _$PlatformLinkCopyWithImpl<$Res, $Val extends PlatformLink>
    implements $PlatformLinkCopyWith<$Res> {
  _$PlatformLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlatformLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? url = null,
    Object? description = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlatformLinkImplCopyWith<$Res>
    implements $PlatformLinkCopyWith<$Res> {
  factory _$$PlatformLinkImplCopyWith(
          _$PlatformLinkImpl value, $Res Function(_$PlatformLinkImpl) then) =
      __$$PlatformLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, IconData icon, String url, String description, String tag});
}

/// @nodoc
class __$$PlatformLinkImplCopyWithImpl<$Res>
    extends _$PlatformLinkCopyWithImpl<$Res, _$PlatformLinkImpl>
    implements _$$PlatformLinkImplCopyWith<$Res> {
  __$$PlatformLinkImplCopyWithImpl(
      _$PlatformLinkImpl _value, $Res Function(_$PlatformLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlatformLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? icon = null,
    Object? url = null,
    Object? description = null,
    Object? tag = null,
  }) {
    return _then(_$PlatformLinkImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlatformLinkImpl implements _PlatformLink {
  const _$PlatformLinkImpl(
      {required this.name,
      required this.icon,
      required this.url,
      required this.description,
      required this.tag});

  @override
  final String name;
  @override
  final IconData icon;
  @override
  final String url;
  @override
  final String description;
  @override
  final String tag;

  @override
  String toString() {
    return 'PlatformLink(name: $name, icon: $icon, url: $url, description: $description, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatformLinkImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, icon, url, description, tag);

  /// Create a copy of PlatformLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlatformLinkImplCopyWith<_$PlatformLinkImpl> get copyWith =>
      __$$PlatformLinkImplCopyWithImpl<_$PlatformLinkImpl>(this, _$identity);
}

abstract class _PlatformLink implements PlatformLink {
  const factory _PlatformLink(
      {required final String name,
      required final IconData icon,
      required final String url,
      required final String description,
      required final String tag}) = _$PlatformLinkImpl;

  @override
  String get name;
  @override
  IconData get icon;
  @override
  String get url;
  @override
  String get description;
  @override
  String get tag;

  /// Create a copy of PlatformLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlatformLinkImplCopyWith<_$PlatformLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
