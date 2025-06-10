import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/show_toast.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

class MyCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.pop(),
        child: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.black,
        ),
      ),
      title: Text(
        'My Cart',
        style: AppStyles.mediumBoldText,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: BlocListener<CartCubit, CartState>(
            listenWhen: (previous, current) =>
                previous.status != CartStatus.cartActionSuccess ||
                previous.status != CartStatus.cartActionFailure &&
                    current.status == CartStatus.cartActionSuccess ||
                current.status == CartStatus.cartActionFailure,
            listener: (context, state) {
              if (state.status == CartStatus.cartActionFailure) {
                return ShowToast.showFailureToast('fail to clear cart');
              }
            },
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogcontext) {
                    return WarningAlertDailog(
                      title: 'Clear Cart',
                      subtitle: 'Are you sure you want to clear your cart?',
                      onOkPressed: () async {
                        await context.read<CartCubit>().clearCart();
                        if (context.mounted) {
                          context.pop();
                        }
                      },
                    );
                  },
                );
              },
              child: Image.asset(
                AppAssets.imagesClearCart,
                height: 25.h,
                width: 25.w,
                color: AppColors.red,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
