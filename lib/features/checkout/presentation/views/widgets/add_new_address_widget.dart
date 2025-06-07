import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/add_and_edit_address_bottomsheet.dart';

class AddNewAddressWidget extends StatelessWidget {
  const AddNewAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("New Address", style: AppStyles.smallBoldText),
        IconButton(
            onPressed: () {
              showAddAndEditAddressBottomSheet(context, checkoutCubit);
            },
            icon: const Icon(Icons.add)),
      ],
    );
  }

  void showAddAndEditAddressBottomSheet(
      BuildContext context, CheckoutCubit checkoutCubit) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: checkoutCubit,
          child: const AddAndEditAddressBottomSheet(),
        );
      },
    );
  }
}
