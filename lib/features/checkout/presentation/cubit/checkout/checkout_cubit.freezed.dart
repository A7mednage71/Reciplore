// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutState {
  CheckoutStatus get status => throw _privateConstructorUsedError;
  CartOverviewResponseModel? get cartOverview =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  AddressActionStatus get addressActionStatus =>
      throw _privateConstructorUsedError;
  AddressActionType get addressActionType => throw _privateConstructorUsedError;
  String? get addressActionMessage => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {CheckoutStatus status,
      CartOverviewResponseModel? cartOverview,
      String? message,
      AddressActionStatus addressActionStatus,
      AddressActionType addressActionType,
      String? addressActionMessage});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cartOverview = freezed,
    Object? message = freezed,
    Object? addressActionStatus = null,
    Object? addressActionType = null,
    Object? addressActionMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckoutStatus,
      cartOverview: freezed == cartOverview
          ? _value.cartOverview
          : cartOverview // ignore: cast_nullable_to_non_nullable
              as CartOverviewResponseModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      addressActionStatus: null == addressActionStatus
          ? _value.addressActionStatus
          : addressActionStatus // ignore: cast_nullable_to_non_nullable
              as AddressActionStatus,
      addressActionType: null == addressActionType
          ? _value.addressActionType
          : addressActionType // ignore: cast_nullable_to_non_nullable
              as AddressActionType,
      addressActionMessage: freezed == addressActionMessage
          ? _value.addressActionMessage
          : addressActionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
          _$CheckoutStateImpl value, $Res Function(_$CheckoutStateImpl) then) =
      __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CheckoutStatus status,
      CartOverviewResponseModel? cartOverview,
      String? message,
      AddressActionStatus addressActionStatus,
      AddressActionType addressActionType,
      String? addressActionMessage});
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
      _$CheckoutStateImpl _value, $Res Function(_$CheckoutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cartOverview = freezed,
    Object? message = freezed,
    Object? addressActionStatus = null,
    Object? addressActionType = null,
    Object? addressActionMessage = freezed,
  }) {
    return _then(_$CheckoutStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckoutStatus,
      cartOverview: freezed == cartOverview
          ? _value.cartOverview
          : cartOverview // ignore: cast_nullable_to_non_nullable
              as CartOverviewResponseModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      addressActionStatus: null == addressActionStatus
          ? _value.addressActionStatus
          : addressActionStatus // ignore: cast_nullable_to_non_nullable
              as AddressActionStatus,
      addressActionType: null == addressActionType
          ? _value.addressActionType
          : addressActionType // ignore: cast_nullable_to_non_nullable
              as AddressActionType,
      addressActionMessage: freezed == addressActionMessage
          ? _value.addressActionMessage
          : addressActionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl(
      {this.status = CheckoutStatus.initial,
      this.cartOverview,
      this.message,
      this.addressActionStatus = AddressActionStatus.initial,
      this.addressActionType = AddressActionType.none,
      this.addressActionMessage});

  @override
  @JsonKey()
  final CheckoutStatus status;
  @override
  final CartOverviewResponseModel? cartOverview;
  @override
  final String? message;
  @override
  @JsonKey()
  final AddressActionStatus addressActionStatus;
  @override
  @JsonKey()
  final AddressActionType addressActionType;
  @override
  final String? addressActionMessage;

  @override
  String toString() {
    return 'CheckoutState(status: $status, cartOverview: $cartOverview, message: $message, addressActionStatus: $addressActionStatus, addressActionType: $addressActionType, addressActionMessage: $addressActionMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cartOverview, cartOverview) ||
                other.cartOverview == cartOverview) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.addressActionStatus, addressActionStatus) ||
                other.addressActionStatus == addressActionStatus) &&
            (identical(other.addressActionType, addressActionType) ||
                other.addressActionType == addressActionType) &&
            (identical(other.addressActionMessage, addressActionMessage) ||
                other.addressActionMessage == addressActionMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, cartOverview, message,
      addressActionStatus, addressActionType, addressActionMessage);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState(
      {final CheckoutStatus status,
      final CartOverviewResponseModel? cartOverview,
      final String? message,
      final AddressActionStatus addressActionStatus,
      final AddressActionType addressActionType,
      final String? addressActionMessage}) = _$CheckoutStateImpl;

  @override
  CheckoutStatus get status;
  @override
  CartOverviewResponseModel? get cartOverview;
  @override
  String? get message;
  @override
  AddressActionStatus get addressActionStatus;
  @override
  AddressActionType get addressActionType;
  @override
  String? get addressActionMessage;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
