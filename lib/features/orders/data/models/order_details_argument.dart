import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';

class OrderDetailsArgument {
  final OrdersCubit orderCubit;
  final OrderModel order;

  OrderDetailsArgument({required this.orderCubit, required this.order});
}
