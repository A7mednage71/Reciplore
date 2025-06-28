// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrdersState {
  OrdersStatus get status => throw _privateConstructorUsedError;
  GetOrdersResponseModel? get getOrdersResponseModel =>
      throw _privateConstructorUsedError;
  List<OrderModel>? get filteredOrders => throw _privateConstructorUsedError;
  String? get selectedFilterStatus => throw _privateConstructorUsedError;
  OrderActionStatus get orderActionStatus => throw _privateConstructorUsedError;
  OrderActionType get orderActionType => throw _privateConstructorUsedError;
  CheckoutSessionResponseModel? get paymentSession =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  OrderModel? get currentOrderDetails => throw _privateConstructorUsedError;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersStateCopyWith<OrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
  @useResult
  $Res call(
      {OrdersStatus status,
      GetOrdersResponseModel? getOrdersResponseModel,
      List<OrderModel>? filteredOrders,
      String? selectedFilterStatus,
      OrderActionStatus orderActionStatus,
      OrderActionType orderActionType,
      CheckoutSessionResponseModel? paymentSession,
      String? errorMessage,
      OrderModel? currentOrderDetails});
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? getOrdersResponseModel = freezed,
    Object? filteredOrders = freezed,
    Object? selectedFilterStatus = freezed,
    Object? orderActionStatus = null,
    Object? orderActionType = null,
    Object? paymentSession = freezed,
    Object? errorMessage = freezed,
    Object? currentOrderDetails = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrdersStatus,
      getOrdersResponseModel: freezed == getOrdersResponseModel
          ? _value.getOrdersResponseModel
          : getOrdersResponseModel // ignore: cast_nullable_to_non_nullable
              as GetOrdersResponseModel?,
      filteredOrders: freezed == filteredOrders
          ? _value.filteredOrders
          : filteredOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      selectedFilterStatus: freezed == selectedFilterStatus
          ? _value.selectedFilterStatus
          : selectedFilterStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      orderActionStatus: null == orderActionStatus
          ? _value.orderActionStatus
          : orderActionStatus // ignore: cast_nullable_to_non_nullable
              as OrderActionStatus,
      orderActionType: null == orderActionType
          ? _value.orderActionType
          : orderActionType // ignore: cast_nullable_to_non_nullable
              as OrderActionType,
      paymentSession: freezed == paymentSession
          ? _value.paymentSession
          : paymentSession // ignore: cast_nullable_to_non_nullable
              as CheckoutSessionResponseModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderDetails: freezed == currentOrderDetails
          ? _value.currentOrderDetails
          : currentOrderDetails // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrdersStateImplCopyWith<$Res>
    implements $OrdersStateCopyWith<$Res> {
  factory _$$OrdersStateImplCopyWith(
          _$OrdersStateImpl value, $Res Function(_$OrdersStateImpl) then) =
      __$$OrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrdersStatus status,
      GetOrdersResponseModel? getOrdersResponseModel,
      List<OrderModel>? filteredOrders,
      String? selectedFilterStatus,
      OrderActionStatus orderActionStatus,
      OrderActionType orderActionType,
      CheckoutSessionResponseModel? paymentSession,
      String? errorMessage,
      OrderModel? currentOrderDetails});
}

/// @nodoc
class __$$OrdersStateImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateImpl>
    implements _$$OrdersStateImplCopyWith<$Res> {
  __$$OrdersStateImplCopyWithImpl(
      _$OrdersStateImpl _value, $Res Function(_$OrdersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? getOrdersResponseModel = freezed,
    Object? filteredOrders = freezed,
    Object? selectedFilterStatus = freezed,
    Object? orderActionStatus = null,
    Object? orderActionType = null,
    Object? paymentSession = freezed,
    Object? errorMessage = freezed,
    Object? currentOrderDetails = freezed,
  }) {
    return _then(_$OrdersStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrdersStatus,
      getOrdersResponseModel: freezed == getOrdersResponseModel
          ? _value.getOrdersResponseModel
          : getOrdersResponseModel // ignore: cast_nullable_to_non_nullable
              as GetOrdersResponseModel?,
      filteredOrders: freezed == filteredOrders
          ? _value._filteredOrders
          : filteredOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
      selectedFilterStatus: freezed == selectedFilterStatus
          ? _value.selectedFilterStatus
          : selectedFilterStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      orderActionStatus: null == orderActionStatus
          ? _value.orderActionStatus
          : orderActionStatus // ignore: cast_nullable_to_non_nullable
              as OrderActionStatus,
      orderActionType: null == orderActionType
          ? _value.orderActionType
          : orderActionType // ignore: cast_nullable_to_non_nullable
              as OrderActionType,
      paymentSession: freezed == paymentSession
          ? _value.paymentSession
          : paymentSession // ignore: cast_nullable_to_non_nullable
              as CheckoutSessionResponseModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currentOrderDetails: freezed == currentOrderDetails
          ? _value.currentOrderDetails
          : currentOrderDetails // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  const _$OrdersStateImpl(
      {this.status = OrdersStatus.initial,
      this.getOrdersResponseModel,
      final List<OrderModel>? filteredOrders,
      this.selectedFilterStatus,
      this.orderActionStatus = OrderActionStatus.initial,
      this.orderActionType = OrderActionType.none,
      this.paymentSession,
      this.errorMessage,
      this.currentOrderDetails})
      : _filteredOrders = filteredOrders;

  @override
  @JsonKey()
  final OrdersStatus status;
  @override
  final GetOrdersResponseModel? getOrdersResponseModel;
  final List<OrderModel>? _filteredOrders;
  @override
  List<OrderModel>? get filteredOrders {
    final value = _filteredOrders;
    if (value == null) return null;
    if (_filteredOrders is EqualUnmodifiableListView) return _filteredOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? selectedFilterStatus;
  @override
  @JsonKey()
  final OrderActionStatus orderActionStatus;
  @override
  @JsonKey()
  final OrderActionType orderActionType;
  @override
  final CheckoutSessionResponseModel? paymentSession;
  @override
  final String? errorMessage;
  @override
  final OrderModel? currentOrderDetails;

  @override
  String toString() {
    return 'OrdersState(status: $status, getOrdersResponseModel: $getOrdersResponseModel, filteredOrders: $filteredOrders, selectedFilterStatus: $selectedFilterStatus, orderActionStatus: $orderActionStatus, orderActionType: $orderActionType, paymentSession: $paymentSession, errorMessage: $errorMessage, currentOrderDetails: $currentOrderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.getOrdersResponseModel, getOrdersResponseModel) ||
                other.getOrdersResponseModel == getOrdersResponseModel) &&
            const DeepCollectionEquality()
                .equals(other._filteredOrders, _filteredOrders) &&
            (identical(other.selectedFilterStatus, selectedFilterStatus) ||
                other.selectedFilterStatus == selectedFilterStatus) &&
            (identical(other.orderActionStatus, orderActionStatus) ||
                other.orderActionStatus == orderActionStatus) &&
            (identical(other.orderActionType, orderActionType) ||
                other.orderActionType == orderActionType) &&
            (identical(other.paymentSession, paymentSession) ||
                other.paymentSession == paymentSession) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentOrderDetails, currentOrderDetails) ||
                other.currentOrderDetails == currentOrderDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      getOrdersResponseModel,
      const DeepCollectionEquality().hash(_filteredOrders),
      selectedFilterStatus,
      orderActionStatus,
      orderActionType,
      paymentSession,
      errorMessage,
      currentOrderDetails);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      __$$OrdersStateImplCopyWithImpl<_$OrdersStateImpl>(this, _$identity);
}

abstract class _OrdersState implements OrdersState {
  const factory _OrdersState(
      {final OrdersStatus status,
      final GetOrdersResponseModel? getOrdersResponseModel,
      final List<OrderModel>? filteredOrders,
      final String? selectedFilterStatus,
      final OrderActionStatus orderActionStatus,
      final OrderActionType orderActionType,
      final CheckoutSessionResponseModel? paymentSession,
      final String? errorMessage,
      final OrderModel? currentOrderDetails}) = _$OrdersStateImpl;

  @override
  OrdersStatus get status;
  @override
  GetOrdersResponseModel? get getOrdersResponseModel;
  @override
  List<OrderModel>? get filteredOrders;
  @override
  String? get selectedFilterStatus;
  @override
  OrderActionStatus get orderActionStatus;
  @override
  OrderActionType get orderActionType;
  @override
  CheckoutSessionResponseModel? get paymentSession;
  @override
  String? get errorMessage;
  @override
  OrderModel? get currentOrderDetails;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
