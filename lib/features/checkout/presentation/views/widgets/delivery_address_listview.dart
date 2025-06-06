import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/add_and_edit_address_bottomsheet.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_addresse_card.dart';

class DeliveryAddressListView extends StatefulWidget {
  const DeliveryAddressListView({
    super.key,
  });

  @override
  State<DeliveryAddressListView> createState() =>
      _DeliveryAddressListViewState();
}

class _DeliveryAddressListViewState extends State<DeliveryAddressListView> {
  int isactive = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    isactive = index;
                  });
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 5.h),
                  child: DeliveryAddressCard(
                    address: '123 Main Street, City',
                    title: 'home',
                    isactive: isactive == index,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("New Address", style: AppStyles.smallBoldText),
            IconButton(
                onPressed: () {
                  showAddAndEditAddressBottomSheet(context);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }

  void showAddAndEditAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
      context: context,
      builder: (context) {
        return const AddAndEditAddressBottomSheet();
      },
    );
  }
}
