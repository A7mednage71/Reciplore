// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DietPlanState {
  DietPlanStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get goal => throw _privateConstructorUsedError;

  /// Create a copy of DietPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DietPlanStateCopyWith<DietPlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietPlanStateCopyWith<$Res> {
  factory $DietPlanStateCopyWith(
          DietPlanState value, $Res Function(DietPlanState) then) =
      _$DietPlanStateCopyWithImpl<$Res, DietPlanState>;
  @useResult
  $Res call(
      {DietPlanStatus status, String? message, String? gender, String? goal});
}

/// @nodoc
class _$DietPlanStateCopyWithImpl<$Res, $Val extends DietPlanState>
    implements $DietPlanStateCopyWith<$Res> {
  _$DietPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DietPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? gender = freezed,
    Object? goal = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DietPlanStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DietPlanStateImplCopyWith<$Res>
    implements $DietPlanStateCopyWith<$Res> {
  factory _$$DietPlanStateImplCopyWith(
          _$DietPlanStateImpl value, $Res Function(_$DietPlanStateImpl) then) =
      __$$DietPlanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DietPlanStatus status, String? message, String? gender, String? goal});
}

/// @nodoc
class __$$DietPlanStateImplCopyWithImpl<$Res>
    extends _$DietPlanStateCopyWithImpl<$Res, _$DietPlanStateImpl>
    implements _$$DietPlanStateImplCopyWith<$Res> {
  __$$DietPlanStateImplCopyWithImpl(
      _$DietPlanStateImpl _value, $Res Function(_$DietPlanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DietPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? gender = freezed,
    Object? goal = freezed,
  }) {
    return _then(_$DietPlanStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DietPlanStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DietPlanStateImpl implements _DietPlanState {
  const _$DietPlanStateImpl(
      {this.status = DietPlanStatus.initial,
      this.message,
      this.gender,
      this.goal});

  @override
  @JsonKey()
  final DietPlanStatus status;
  @override
  final String? message;
  @override
  final String? gender;
  @override
  final String? goal;

  @override
  String toString() {
    return 'DietPlanState(status: $status, message: $message, gender: $gender, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DietPlanStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, gender, goal);

  /// Create a copy of DietPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DietPlanStateImplCopyWith<_$DietPlanStateImpl> get copyWith =>
      __$$DietPlanStateImplCopyWithImpl<_$DietPlanStateImpl>(this, _$identity);
}

abstract class _DietPlanState implements DietPlanState {
  const factory _DietPlanState(
      {final DietPlanStatus status,
      final String? message,
      final String? gender,
      final String? goal}) = _$DietPlanStateImpl;

  @override
  DietPlanStatus get status;
  @override
  String? get message;
  @override
  String? get gender;
  @override
  String? get goal;

  /// Create a copy of DietPlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DietPlanStateImplCopyWith<_$DietPlanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
