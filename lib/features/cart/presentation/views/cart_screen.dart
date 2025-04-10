import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_screen_body.dart';
import 'package:looqma/features/cart/presentation/views/widgets/my_cart_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCartAppBar(),
      body: BlocConsumer<CartCubit, CartState>(
        listenWhen: (previous, current) =>
            previous.status != CartStatus.cartActionFailure,
        listener: (context, state) {
          if (state.status == CartStatus.cartActionFailure) {
            ShowToast.showFailureToast(state.responseMessage ?? '');
          }
        },
        buildWhen: (previous, current) =>
            previous.getCartReponseModel != current.getCartReponseModel ||
            current.status == CartStatus.failure,
        builder: (context, state) {
          if (state.status == CartStatus.failure) {
            return FailureState(hight: 100.h, message: state.responseMessage);
          } else if (state.status == CartStatus.loading) {
            return Center(
              child:
                  SpinKitFadingCircle(color: AppColors.primaryDark, size: 60.r),
            );
          } else if (state.getCartReponseModel == null ||
              state.getCartReponseModel!.cart.ingredients.isEmpty) {
            return EmptyState(message: 'Cart is empty', value: 250.h);
          } else {
            return CartScreenBody(cartReponseModel: state.getCartReponseModel!);
          }
        },
      ),
    );
  }
}
