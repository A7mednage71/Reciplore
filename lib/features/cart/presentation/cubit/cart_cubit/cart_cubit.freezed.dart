// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  CartStatus get status => throw _privateConstructorUsedError;
  GetCartReponseModel? get getCartReponseModel =>
      throw _privateConstructorUsedError;
  CartActionType? get actionType => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  String? get lastAffectedIngredientId => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {CartStatus status,
      GetCartReponseModel? getCartReponseModel,
      CartActionType? actionType,
      String? responseMessage,
      String? lastAffectedIngredientId});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? getCartReponseModel = freezed,
    Object? actionType = freezed,
    Object? responseMessage = freezed,
    Object? lastAffectedIngredientId = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      getCartReponseModel: freezed == getCartReponseModel
          ? _value.getCartReponseModel
          : getCartReponseModel // ignore: cast_nullable_to_non_nullable
              as GetCartReponseModel?,
      actionType: freezed == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as CartActionType?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAffectedIngredientId: freezed == lastAffectedIngredientId
          ? _value.lastAffectedIngredientId
          : lastAffectedIngredientId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CartStatus status,
      GetCartReponseModel? getCartReponseModel,
      CartActionType? actionType,
      String? responseMessage,
      String? lastAffectedIngredientId});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? getCartReponseModel = freezed,
    Object? actionType = freezed,
    Object? responseMessage = freezed,
    Object? lastAffectedIngredientId = freezed,
  }) {
    return _then(_$CartStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      getCartReponseModel: freezed == getCartReponseModel
          ? _value.getCartReponseModel
          : getCartReponseModel // ignore: cast_nullable_to_non_nullable
              as GetCartReponseModel?,
      actionType: freezed == actionType
          ? _value.actionType
          : actionType // ignore: cast_nullable_to_non_nullable
              as CartActionType?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastAffectedIngredientId: freezed == lastAffectedIngredientId
          ? _value.lastAffectedIngredientId
          : lastAffectedIngredientId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {this.status = CartStatus.initial,
      this.getCartReponseModel,
      this.actionType,
      this.responseMessage,
      this.lastAffectedIngredientId});

  @override
  @JsonKey()
  final CartStatus status;
  @override
  final GetCartReponseModel? getCartReponseModel;
  @override
  final CartActionType? actionType;
  @override
  final String? responseMessage;
  @override
  final String? lastAffectedIngredientId;

  @override
  String toString() {
    return 'CartState(status: $status, getCartReponseModel: $getCartReponseModel, actionType: $actionType, responseMessage: $responseMessage, lastAffectedIngredientId: $lastAffectedIngredientId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.getCartReponseModel, getCartReponseModel) ||
                other.getCartReponseModel == getCartReponseModel) &&
            (identical(other.actionType, actionType) ||
                other.actionType == actionType) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(
                    other.lastAffectedIngredientId, lastAffectedIngredientId) ||
                other.lastAffectedIngredientId == lastAffectedIngredientId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, getCartReponseModel,
      actionType, responseMessage, lastAffectedIngredientId);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final CartStatus status,
      final GetCartReponseModel? getCartReponseModel,
      final CartActionType? actionType,
      final String? responseMessage,
      final String? lastAffectedIngredientId}) = _$CartStateImpl;

  @override
  CartStatus get status;
  @override
  GetCartReponseModel? get getCartReponseModel;
  @override
  CartActionType? get actionType;
  @override
  String? get responseMessage;
  @override
  String? get lastAffectedIngredientId;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
