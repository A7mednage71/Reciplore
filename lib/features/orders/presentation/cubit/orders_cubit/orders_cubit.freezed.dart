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
  OrderActionStatus get orderActionStatus => throw _privateConstructorUsedError;
  GetOrdersResponseModel? get getOrdersResponseModel =>
      throw _privateConstructorUsedError;
  List<OrderModel>? get filteredOrders => throw _privateConstructorUsedError;
  String? get selectedFilterStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
      OrderActionStatus orderActionStatus,
      GetOrdersResponseModel? getOrdersResponseModel,
      List<OrderModel>? filteredOrders,
      String? selectedFilterStatus,
      String? errorMessage});
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
    Object? orderActionStatus = null,
    Object? getOrdersResponseModel = freezed,
    Object? filteredOrders = freezed,
    Object? selectedFilterStatus = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrdersStatus,
      orderActionStatus: null == orderActionStatus
          ? _value.orderActionStatus
          : orderActionStatus // ignore: cast_nullable_to_non_nullable
              as OrderActionStatus,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
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
      OrderActionStatus orderActionStatus,
      GetOrdersResponseModel? getOrdersResponseModel,
      List<OrderModel>? filteredOrders,
      String? selectedFilterStatus,
      String? errorMessage});
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
    Object? orderActionStatus = null,
    Object? getOrdersResponseModel = freezed,
    Object? filteredOrders = freezed,
    Object? selectedFilterStatus = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$OrdersStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrdersStatus,
      orderActionStatus: null == orderActionStatus
          ? _value.orderActionStatus
          : orderActionStatus // ignore: cast_nullable_to_non_nullable
              as OrderActionStatus,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  const _$OrdersStateImpl(
      {this.status = OrdersStatus.initial,
      this.orderActionStatus = OrderActionStatus.initial,
      this.getOrdersResponseModel,
      final List<OrderModel>? filteredOrders,
      this.selectedFilterStatus,
      this.errorMessage})
      : _filteredOrders = filteredOrders;

  @override
  @JsonKey()
  final OrdersStatus status;
  @override
  @JsonKey()
  final OrderActionStatus orderActionStatus;
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
  final String? errorMessage;

  @override
  String toString() {
    return 'OrdersState(status: $status, orderActionStatus: $orderActionStatus, getOrdersResponseModel: $getOrdersResponseModel, filteredOrders: $filteredOrders, selectedFilterStatus: $selectedFilterStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderActionStatus, orderActionStatus) ||
                other.orderActionStatus == orderActionStatus) &&
            (identical(other.getOrdersResponseModel, getOrdersResponseModel) ||
                other.getOrdersResponseModel == getOrdersResponseModel) &&
            const DeepCollectionEquality()
                .equals(other._filteredOrders, _filteredOrders) &&
            (identical(other.selectedFilterStatus, selectedFilterStatus) ||
                other.selectedFilterStatus == selectedFilterStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      orderActionStatus,
      getOrdersResponseModel,
      const DeepCollectionEquality().hash(_filteredOrders),
      selectedFilterStatus,
      errorMessage);

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
      final OrderActionStatus orderActionStatus,
      final GetOrdersResponseModel? getOrdersResponseModel,
      final List<OrderModel>? filteredOrders,
      final String? selectedFilterStatus,
      final String? errorMessage}) = _$OrdersStateImpl;

  @override
  OrdersStatus get status;
  @override
  OrderActionStatus get orderActionStatus;
  @override
  GetOrdersResponseModel? get getOrdersResponseModel;
  @override
  List<OrderModel>? get filteredOrders;
  @override
  String? get selectedFilterStatus;
  @override
  String? get errorMessage;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
