import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/common/models/address_model.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/add_and_edit_address_bottomsheet.dart';

class DeliveryAddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isactive;

  const DeliveryAddressCard({
    super.key,
    required this.address,
    this.isactive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 1 / 5,
        children: [
          SizedBox(width: 5.w),
          SlidableAction(
            onPressed: (context) async {
              await context.read<CheckoutCubit>().deleteAddress(id: address.id);
            },
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            icon: Icons.delete_outline,
            borderRadius: BorderRadius.circular(10.r),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      child: AnimatedContainer(
        height: 70.h,
        duration: const Duration(milliseconds: 300),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            side: BorderSide(
              width: 1,
              color: isactive ? AppColors.primarybright : AppColors.grayLight,
            ),
          ),
        ),
        child: Card(
          elevation: 0,
          color: AppColors.grayLighter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ListTile(
            leading: Icon(Icons.location_on, size: 30.r),
            title: Text(address.addressLabel, style: AppStyles.smallBoldText),
            subtitle: Text("${address.country}, ${address.city}",
                style: AppStyles.smallRegularText),
            trailing: IconButton(
              onPressed: () {
                showAddAndEditAddressBottomSheet(context);
              },
              icon: Icon(Icons.edit, size: 20.r),
            ),
          ),
        ),
      ),
    );
  }

  void showAddAndEditAddressBottomSheet(BuildContext context) {
    final checkoutCubit = context.read<CheckoutCubit>();
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: checkoutCubit,
          child: AddAndEditAddressBottomSheet(isEdit: true, address: address),
        );
      },
    );
  }
}
