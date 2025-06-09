import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/address_model.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_addresse_card.dart';

class DeliveryAddressListView extends StatefulWidget {
  const DeliveryAddressListView({
    super.key,
    required this.addresses,
  });
  final List<AddressModel> addresses;

  @override
  State<DeliveryAddressListView> createState() =>
      _DeliveryAddressListViewState();
}

class _DeliveryAddressListViewState extends State<DeliveryAddressListView> {
  int isactive = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: widget.addresses.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              setState(() {
                isactive = index;
              });
              await context
                  .read<CheckoutCubit>()
                  .setshippingAddressID(addressID: widget.addresses[index].id);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: index == 0 ? 0 : 5.h),
              child: DeliveryAddressCard(
                address: widget.addresses[index],
                isactive: isactive == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
