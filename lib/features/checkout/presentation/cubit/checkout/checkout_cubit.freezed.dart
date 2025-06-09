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
  int? get originalTotal => throw _privateConstructorUsedError;
  String? get shippingAddressID => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  AddressActionStatus get addressActionStatus =>
      throw _privateConstructorUsedError;
  AddressActionType get addressActionType => throw _privateConstructorUsedError;
  String? get addressActionMessage => throw _privateConstructorUsedError;
  CouponCodeStatus get couponStatus => throw _privateConstructorUsedError;
  String? get couponCode => throw _privateConstructorUsedError;
  String? get checkCouponMessage => throw _privateConstructorUsedError;
  PlaceOrderStatus? get placeOrderStatus => throw _privateConstructorUsedError;
  PlaceOrderResponseModel? get placeOrderResponse =>
      throw _privateConstructorUsedError;
  String? get placeOrderMessage => throw _privateConstructorUsedError;
  PaymentMethodStatus get paymentMethodStatus =>
      throw _privateConstructorUsedError;
  CheckoutSessionResponseModel? get checkoutSessionResponse =>
      throw _privateConstructorUsedError;
  String? get paymentMethodMessage => throw _privateConstructorUsedError;

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
      int? originalTotal,
      String? shippingAddressID,
      String? paymentMethod,
      String? message,
      AddressActionStatus addressActionStatus,
      AddressActionType addressActionType,
      String? addressActionMessage,
      CouponCodeStatus couponStatus,
      String? couponCode,
      String? checkCouponMessage,
      PlaceOrderStatus? placeOrderStatus,
      PlaceOrderResponseModel? placeOrderResponse,
      String? placeOrderMessage,
      PaymentMethodStatus paymentMethodStatus,
      CheckoutSessionResponseModel? checkoutSessionResponse,
      String? paymentMethodMessage});
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
    Object? originalTotal = freezed,
    Object? shippingAddressID = freezed,
    Object? paymentMethod = freezed,
    Object? message = freezed,
    Object? addressActionStatus = null,
    Object? addressActionType = null,
    Object? addressActionMessage = freezed,
    Object? couponStatus = null,
    Object? couponCode = freezed,
    Object? checkCouponMessage = freezed,
    Object? placeOrderStatus = freezed,
    Object? placeOrderResponse = freezed,
    Object? placeOrderMessage = freezed,
    Object? paymentMethodStatus = null,
    Object? checkoutSessionResponse = freezed,
    Object? paymentMethodMessage = freezed,
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
      originalTotal: freezed == originalTotal
          ? _value.originalTotal
          : originalTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAddressID: freezed == shippingAddressID
          ? _value.shippingAddressID
          : shippingAddressID // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
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
      couponStatus: null == couponStatus
          ? _value.couponStatus
          : couponStatus // ignore: cast_nullable_to_non_nullable
              as CouponCodeStatus,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      checkCouponMessage: freezed == checkCouponMessage
          ? _value.checkCouponMessage
          : checkCouponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOrderStatus: freezed == placeOrderStatus
          ? _value.placeOrderStatus
          : placeOrderStatus // ignore: cast_nullable_to_non_nullable
              as PlaceOrderStatus?,
      placeOrderResponse: freezed == placeOrderResponse
          ? _value.placeOrderResponse
          : placeOrderResponse // ignore: cast_nullable_to_non_nullable
              as PlaceOrderResponseModel?,
      placeOrderMessage: freezed == placeOrderMessage
          ? _value.placeOrderMessage
          : placeOrderMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodStatus: null == paymentMethodStatus
          ? _value.paymentMethodStatus
          : paymentMethodStatus // ignore: cast_nullable_to_non_nullable
              as PaymentMethodStatus,
      checkoutSessionResponse: freezed == checkoutSessionResponse
          ? _value.checkoutSessionResponse
          : checkoutSessionResponse // ignore: cast_nullable_to_non_nullable
              as CheckoutSessionResponseModel?,
      paymentMethodMessage: freezed == paymentMethodMessage
          ? _value.paymentMethodMessage
          : paymentMethodMessage // ignore: cast_nullable_to_non_nullable
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
      int? originalTotal,
      String? shippingAddressID,
      String? paymentMethod,
      String? message,
      AddressActionStatus addressActionStatus,
      AddressActionType addressActionType,
      String? addressActionMessage,
      CouponCodeStatus couponStatus,
      String? couponCode,
      String? checkCouponMessage,
      PlaceOrderStatus? placeOrderStatus,
      PlaceOrderResponseModel? placeOrderResponse,
      String? placeOrderMessage,
      PaymentMethodStatus paymentMethodStatus,
      CheckoutSessionResponseModel? checkoutSessionResponse,
      String? paymentMethodMessage});
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
    Object? originalTotal = freezed,
    Object? shippingAddressID = freezed,
    Object? paymentMethod = freezed,
    Object? message = freezed,
    Object? addressActionStatus = null,
    Object? addressActionType = null,
    Object? addressActionMessage = freezed,
    Object? couponStatus = null,
    Object? couponCode = freezed,
    Object? checkCouponMessage = freezed,
    Object? placeOrderStatus = freezed,
    Object? placeOrderResponse = freezed,
    Object? placeOrderMessage = freezed,
    Object? paymentMethodStatus = null,
    Object? checkoutSessionResponse = freezed,
    Object? paymentMethodMessage = freezed,
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
      originalTotal: freezed == originalTotal
          ? _value.originalTotal
          : originalTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAddressID: freezed == shippingAddressID
          ? _value.shippingAddressID
          : shippingAddressID // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
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
      couponStatus: null == couponStatus
          ? _value.couponStatus
          : couponStatus // ignore: cast_nullable_to_non_nullable
              as CouponCodeStatus,
      couponCode: freezed == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      checkCouponMessage: freezed == checkCouponMessage
          ? _value.checkCouponMessage
          : checkCouponMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOrderStatus: freezed == placeOrderStatus
          ? _value.placeOrderStatus
          : placeOrderStatus // ignore: cast_nullable_to_non_nullable
              as PlaceOrderStatus?,
      placeOrderResponse: freezed == placeOrderResponse
          ? _value.placeOrderResponse
          : placeOrderResponse // ignore: cast_nullable_to_non_nullable
              as PlaceOrderResponseModel?,
      placeOrderMessage: freezed == placeOrderMessage
          ? _value.placeOrderMessage
          : placeOrderMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodStatus: null == paymentMethodStatus
          ? _value.paymentMethodStatus
          : paymentMethodStatus // ignore: cast_nullable_to_non_nullable
              as PaymentMethodStatus,
      checkoutSessionResponse: freezed == checkoutSessionResponse
          ? _value.checkoutSessionResponse
          : checkoutSessionResponse // ignore: cast_nullable_to_non_nullable
              as CheckoutSessionResponseModel?,
      paymentMethodMessage: freezed == paymentMethodMessage
          ? _value.paymentMethodMessage
          : paymentMethodMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl(
      {this.status = CheckoutStatus.initial,
      this.cartOverview,
      this.originalTotal,
      this.shippingAddressID,
      this.paymentMethod,
      this.message,
      this.addressActionStatus = AddressActionStatus.initial,
      this.addressActionType = AddressActionType.none,
      this.addressActionMessage,
      this.couponStatus = CouponCodeStatus.initial,
      this.couponCode,
      this.checkCouponMessage,
      this.placeOrderStatus = PlaceOrderStatus.initial,
      this.placeOrderResponse,
      this.placeOrderMessage,
      this.paymentMethodStatus = PaymentMethodStatus.initial,
      this.checkoutSessionResponse,
      this.paymentMethodMessage});

  @override
  @JsonKey()
  final CheckoutStatus status;
  @override
  final CartOverviewResponseModel? cartOverview;
  @override
  final int? originalTotal;
  @override
  final String? shippingAddressID;
  @override
  final String? paymentMethod;
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
  @JsonKey()
  final CouponCodeStatus couponStatus;
  @override
  final String? couponCode;
  @override
  final String? checkCouponMessage;
  @override
  @JsonKey()
  final PlaceOrderStatus? placeOrderStatus;
  @override
  final PlaceOrderResponseModel? placeOrderResponse;
  @override
  final String? placeOrderMessage;
  @override
  @JsonKey()
  final PaymentMethodStatus paymentMethodStatus;
  @override
  final CheckoutSessionResponseModel? checkoutSessionResponse;
  @override
  final String? paymentMethodMessage;

  @override
  String toString() {
    return 'CheckoutState(status: $status, cartOverview: $cartOverview, originalTotal: $originalTotal, shippingAddressID: $shippingAddressID, paymentMethod: $paymentMethod, message: $message, addressActionStatus: $addressActionStatus, addressActionType: $addressActionType, addressActionMessage: $addressActionMessage, couponStatus: $couponStatus, couponCode: $couponCode, checkCouponMessage: $checkCouponMessage, placeOrderStatus: $placeOrderStatus, placeOrderResponse: $placeOrderResponse, placeOrderMessage: $placeOrderMessage, paymentMethodStatus: $paymentMethodStatus, checkoutSessionResponse: $checkoutSessionResponse, paymentMethodMessage: $paymentMethodMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cartOverview, cartOverview) ||
                other.cartOverview == cartOverview) &&
            (identical(other.originalTotal, originalTotal) ||
                other.originalTotal == originalTotal) &&
            (identical(other.shippingAddressID, shippingAddressID) ||
                other.shippingAddressID == shippingAddressID) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.addressActionStatus, addressActionStatus) ||
                other.addressActionStatus == addressActionStatus) &&
            (identical(other.addressActionType, addressActionType) ||
                other.addressActionType == addressActionType) &&
            (identical(other.addressActionMessage, addressActionMessage) ||
                other.addressActionMessage == addressActionMessage) &&
            (identical(other.couponStatus, couponStatus) ||
                other.couponStatus == couponStatus) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.checkCouponMessage, checkCouponMessage) ||
                other.checkCouponMessage == checkCouponMessage) &&
            (identical(other.placeOrderStatus, placeOrderStatus) ||
                other.placeOrderStatus == placeOrderStatus) &&
            (identical(other.placeOrderResponse, placeOrderResponse) ||
                other.placeOrderResponse == placeOrderResponse) &&
            (identical(other.placeOrderMessage, placeOrderMessage) ||
                other.placeOrderMessage == placeOrderMessage) &&
            (identical(other.paymentMethodStatus, paymentMethodStatus) ||
                other.paymentMethodStatus == paymentMethodStatus) &&
            (identical(
                    other.checkoutSessionResponse, checkoutSessionResponse) ||
                other.checkoutSessionResponse == checkoutSessionResponse) &&
            (identical(other.paymentMethodMessage, paymentMethodMessage) ||
                other.paymentMethodMessage == paymentMethodMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      cartOverview,
      originalTotal,
      shippingAddressID,
      paymentMethod,
      message,
      addressActionStatus,
      addressActionType,
      addressActionMessage,
      couponStatus,
      couponCode,
      checkCouponMessage,
      placeOrderStatus,
      placeOrderResponse,
      placeOrderMessage,
      paymentMethodStatus,
      checkoutSessionResponse,
      paymentMethodMessage);

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
      final int? originalTotal,
      final String? shippingAddressID,
      final String? paymentMethod,
      final String? message,
      final AddressActionStatus addressActionStatus,
      final AddressActionType addressActionType,
      final String? addressActionMessage,
      final CouponCodeStatus couponStatus,
      final String? couponCode,
      final String? checkCouponMessage,
      final PlaceOrderStatus? placeOrderStatus,
      final PlaceOrderResponseModel? placeOrderResponse,
      final String? placeOrderMessage,
      final PaymentMethodStatus paymentMethodStatus,
      final CheckoutSessionResponseModel? checkoutSessionResponse,
      final String? paymentMethodMessage}) = _$CheckoutStateImpl;

  @override
  CheckoutStatus get status;
  @override
  CartOverviewResponseModel? get cartOverview;
  @override
  int? get originalTotal;
  @override
  String? get shippingAddressID;
  @override
  String? get paymentMethod;
  @override
  String? get message;
  @override
  AddressActionStatus get addressActionStatus;
  @override
  AddressActionType get addressActionType;
  @override
  String? get addressActionMessage;
  @override
  CouponCodeStatus get couponStatus;
  @override
  String? get couponCode;
  @override
  String? get checkCouponMessage;
  @override
  PlaceOrderStatus? get placeOrderStatus;
  @override
  PlaceOrderResponseModel? get placeOrderResponse;
  @override
  String? get placeOrderMessage;
  @override
  PaymentMethodStatus get paymentMethodStatus;
  @override
  CheckoutSessionResponseModel? get checkoutSessionResponse;
  @override
  String? get paymentMethodMessage;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
