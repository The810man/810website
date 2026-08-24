// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typewriter_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypewriterConfig {
  String get text => throw _privateConstructorUsedError;
  Duration get charInterval => throw _privateConstructorUsedError;

  /// Create a copy of TypewriterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypewriterConfigCopyWith<TypewriterConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypewriterConfigCopyWith<$Res> {
  factory $TypewriterConfigCopyWith(
          TypewriterConfig value, $Res Function(TypewriterConfig) then) =
      _$TypewriterConfigCopyWithImpl<$Res, TypewriterConfig>;
  @useResult
  $Res call({String text, Duration charInterval});
}

/// @nodoc
class _$TypewriterConfigCopyWithImpl<$Res, $Val extends TypewriterConfig>
    implements $TypewriterConfigCopyWith<$Res> {
  _$TypewriterConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypewriterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? charInterval = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      charInterval: null == charInterval
          ? _value.charInterval
          : charInterval // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypewriterConfigImplCopyWith<$Res>
    implements $TypewriterConfigCopyWith<$Res> {
  factory _$$TypewriterConfigImplCopyWith(_$TypewriterConfigImpl value,
          $Res Function(_$TypewriterConfigImpl) then) =
      __$$TypewriterConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, Duration charInterval});
}

/// @nodoc
class __$$TypewriterConfigImplCopyWithImpl<$Res>
    extends _$TypewriterConfigCopyWithImpl<$Res, _$TypewriterConfigImpl>
    implements _$$TypewriterConfigImplCopyWith<$Res> {
  __$$TypewriterConfigImplCopyWithImpl(_$TypewriterConfigImpl _value,
      $Res Function(_$TypewriterConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of TypewriterConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? charInterval = null,
  }) {
    return _then(_$TypewriterConfigImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      charInterval: null == charInterval
          ? _value.charInterval
          : charInterval // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$TypewriterConfigImpl implements _TypewriterConfig {
  const _$TypewriterConfigImpl(
      {required this.text,
      this.charInterval = const Duration(milliseconds: 45)});

  @override
  final String text;
  @override
  @JsonKey()
  final Duration charInterval;

  @override
  String toString() {
    return 'TypewriterConfig(text: $text, charInterval: $charInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypewriterConfigImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.charInterval, charInterval) ||
                other.charInterval == charInterval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, charInterval);

  /// Create a copy of TypewriterConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypewriterConfigImplCopyWith<_$TypewriterConfigImpl> get copyWith =>
      __$$TypewriterConfigImplCopyWithImpl<_$TypewriterConfigImpl>(
          this, _$identity);
}

abstract class _TypewriterConfig implements TypewriterConfig {
  const factory _TypewriterConfig(
      {required final String text,
      final Duration charInterval}) = _$TypewriterConfigImpl;

  @override
  String get text;
  @override
  Duration get charInterval;

  /// Create a copy of TypewriterConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypewriterConfigImplCopyWith<_$TypewriterConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
