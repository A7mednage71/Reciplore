part of 'orders_cubit.dart';

enum OrdersStatus { initial, loading, success, failure }

enum OrderActionStatus { initial, loading, success, failure }

enum OrderActionType { none, preparePaymentSession, cancel }

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(OrdersStatus.initial) OrdersStatus status,
    GetOrdersResponseModel? getOrdersResponseModel,
    List<OrderModel>? filteredOrders,
    String? selectedFilterStatus,
    @Default(OrderActionStatus.initial) OrderActionStatus orderActionStatus,
    @Default(OrderActionType.none) OrderActionType orderActionType,
    CheckoutSessionResponseModel? paymentSession,
    String? errorMessage,
    OrderModel? currentOrderDetails,
  }) = _OrdersState;
}
