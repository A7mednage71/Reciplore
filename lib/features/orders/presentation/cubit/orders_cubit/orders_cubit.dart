import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    emit(state.copyWith(orderActionStatus: OrderActionStatus.loading));
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
          getOrdersResponseModel:
              state.getOrdersResponseModel?.copyWith(orders: updatedOrders!),
          filteredOrders: updatedOrders,
        ));

        if (state.selectedFilterStatus != null) {
          await filterOrders(status: state.selectedFilterStatus!);
        }
      },
      failure: (failureResponse) {
        emit(state.copyWith(
            orderActionStatus: OrderActionStatus.failure,
            errorMessage: failureResponse.errMessages));
      },
    );
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
}
