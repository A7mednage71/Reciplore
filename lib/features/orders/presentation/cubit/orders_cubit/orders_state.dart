part of 'orders_cubit.dart';

enum OrdersStatus { initial, loading, success, failure }

enum OrderActionStatus { initial, loading, success, failure }

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    @Default(OrdersStatus.initial) OrdersStatus status,
    @Default(OrderActionStatus.initial) OrderActionStatus orderActionStatus,
    GetOrdersResponseModel? getOrdersResponseModel,
    List<OrderModel>? filteredOrders,
    String? selectedFilterStatus,
    String? errorMessage,
  }) = _OrdersState;
}
