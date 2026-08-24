// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_filter_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectFilterState {
  ProjectCategory? get selected => throw _privateConstructorUsedError;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectFilterStateCopyWith<ProjectFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectFilterStateCopyWith<$Res> {
  factory $ProjectFilterStateCopyWith(
          ProjectFilterState value, $Res Function(ProjectFilterState) then) =
      _$ProjectFilterStateCopyWithImpl<$Res, ProjectFilterState>;
  @useResult
  $Res call({ProjectCategory? selected});
}

/// @nodoc
class _$ProjectFilterStateCopyWithImpl<$Res, $Val extends ProjectFilterState>
    implements $ProjectFilterStateCopyWith<$Res> {
  _$ProjectFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as ProjectCategory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectFilterStateImplCopyWith<$Res>
    implements $ProjectFilterStateCopyWith<$Res> {
  factory _$$ProjectFilterStateImplCopyWith(_$ProjectFilterStateImpl value,
          $Res Function(_$ProjectFilterStateImpl) then) =
      __$$ProjectFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProjectCategory? selected});
}

/// @nodoc
class __$$ProjectFilterStateImplCopyWithImpl<$Res>
    extends _$ProjectFilterStateCopyWithImpl<$Res, _$ProjectFilterStateImpl>
    implements _$$ProjectFilterStateImplCopyWith<$Res> {
  __$$ProjectFilterStateImplCopyWithImpl(_$ProjectFilterStateImpl _value,
      $Res Function(_$ProjectFilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(_$ProjectFilterStateImpl(
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as ProjectCategory?,
    ));
  }
}

/// @nodoc

class _$ProjectFilterStateImpl implements _ProjectFilterState {
  const _$ProjectFilterStateImpl({this.selected});

  @override
  final ProjectCategory? selected;

  @override
  String toString() {
    return 'ProjectFilterState(selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFilterStateImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected);

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFilterStateImplCopyWith<_$ProjectFilterStateImpl> get copyWith =>
      __$$ProjectFilterStateImplCopyWithImpl<_$ProjectFilterStateImpl>(
          this, _$identity);
}

abstract class _ProjectFilterState implements ProjectFilterState {
  const factory _ProjectFilterState({final ProjectCategory? selected}) =
      _$ProjectFilterStateImpl;

  @override
  ProjectCategory? get selected;

  /// Create a copy of ProjectFilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectFilterStateImplCopyWith<_$ProjectFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
