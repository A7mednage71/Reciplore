import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/orders/data/models/checkout_session_response_model.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/data/repos/orders_repo.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_status_filters.dart';

part 'orders_cubit.freezed.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo) : super(const OrdersState());

  final OrdersRepo _ordersRepo;

  Future<void> getOrders() async {
    emit(state.copyWith(status: OrdersStatus.loading));
    final result = await _ordersRepo.getOrders();

    result.when(
      success: (successResponse) {
        emit(state.copyWith(
          status: OrdersStatus.success,
          getOrdersResponseModel: successResponse,
          filteredOrders: successResponse.orders,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
          status: OrdersStatus.failure,
          errorMessage: failureResponse.errMessages,
        ));
      },
    );
  }

  Future<void> cancelOrder(String id) async {
    emit(state.copyWith(
        orderActionStatus: OrderActionStatus.loading,
        orderActionType: OrderActionType.cancel));

    final result = await _ordersRepo.cancelOrder(id);

    result.when(
      success: (successResponse) async {
        final updatedOrders = state.getOrdersResponseModel?.orders.map((order) {
          if (order.id == id) {
            return order.copyWith(
                orderStatus: OrdersStatusFiltersEnum.cancelled.name);
          }
          return order;
        }).toList();

        emit(state.copyWith(
          orderActionStatus: OrderActionStatus.success,
          orderActionType: OrderActionType.cancel,
          getOrdersResponseModel:
              state.getOrdersResponseModel?.copyWith(orders: updatedOrders!),
          filteredOrders: updatedOrders,
        ));

        if (state.currentOrderDetails?.id == id) {
          markOrderAsCancelledInOrderDetails();
        }

        if (state.selectedFilterStatus != null) {
          await filterOrders(status: state.selectedFilterStatus!);
        }
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            orderActionStatus: OrderActionStatus.failure,
            orderActionType: OrderActionType.cancel,
            errorMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> prepareStripeSession({required String orderId}) async {
    emit(state.copyWith(
        orderActionStatus: OrderActionStatus.loading,
        orderActionType: OrderActionType.preparePaymentSession));

    final result = await _ordersRepo.payWithStripe(orderId: orderId);

    result.when(
      success: (successResponse) async {
        emit(state.copyWith(
          orderActionStatus: OrderActionStatus.success,
          orderActionType: OrderActionType.preparePaymentSession,
          paymentSession: successResponse,
        ));
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            orderActionStatus: OrderActionStatus.failure,
            orderActionType: OrderActionType.preparePaymentSession,
            errorMessage: failureResponse.errMessages));
      },
    );
  }

  Future<void> updateOrderAspaidOrder({required String id}) async {
    final updatedOrders = state.getOrdersResponseModel?.orders.map((order) {
      if (order.id == id) {
        return order.copyWith(
            orderStatus: OrdersStatusFiltersEnum.confirmed.name);
      }
      return order;
    }).toList();

    emit(state.copyWith(
      orderActionStatus: OrderActionStatus.success,
      getOrdersResponseModel:
          state.getOrdersResponseModel?.copyWith(orders: updatedOrders!),
      filteredOrders: updatedOrders,
    ));

    if (state.currentOrderDetails?.id == id) {
      markOrderAsPaidInOrderDetails();
    }

    if (state.selectedFilterStatus != null) {
      await filterOrders(status: state.selectedFilterStatus!);
    }
  }

  Future<void> filterOrders({required String status}) async {
    if (state.getOrdersResponseModel == null ||
        state.getOrdersResponseModel!.orders.isEmpty) {
      return;
    }
    emit(state.copyWith(selectedFilterStatus: status));

    if (status == 'all') {
      emit(state.copyWith(
        status: OrdersStatus.success,
        filteredOrders: state.getOrdersResponseModel?.orders,
      ));
      return;
    }

    final filteredOrders = state.getOrdersResponseModel?.orders
        .where((element) => element.orderStatus == status)
        .toList();

    emit(state.copyWith(
      status: OrdersStatus.success,
      filteredOrders: filteredOrders,
    ));
  }

  // - Helpers for managing the selected order in the Order Details screen:
  // - Set, clear, and update the selected order's status (paid or cancelled)
  // - Used to control visibility of "Pay Now" and "Cancel" buttons based on order status

  void setCurrentOrderShownInOrderDetails(OrderModel order) {
    emit(state.copyWith(currentOrderDetails: order));
  }

  void clearCurrentOrderShownInOrderDetails() {
    emit(state.copyWith(currentOrderDetails: null));
  }

  void updateSelectedOrderStatus(String newStatus) {
    final selectedOrder = state.currentOrderDetails;
    if (selectedOrder != null) {
      emit(state.copyWith(
        currentOrderDetails: selectedOrder.copyWith(orderStatus: newStatus),
      ));
    }
  }

  markOrderAsPaidInOrderDetails() =>
      updateSelectedOrderStatus(OrdersStatusFiltersEnum.confirmed.name);

  markOrderAsCancelledInOrderDetails() =>
      updateSelectedOrderStatus(OrdersStatusFiltersEnum.cancelled.name);

}
