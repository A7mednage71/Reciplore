import 'package:flutter/material.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/common/models/address_model.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/delivery_address_listview.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DeliveryAddressListViewLoadingSkeleton extends StatelessWidget {
  const DeliveryAddressListViewLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List<AddressModel> addresses = List.generate(
        3,
        (index) => AddressModel(
              addressLabel: 'test address',
              streetName: '',
              id: '',
              userId: '',
              country: 'test',
              city: 'test',
              postalCode: 0,
              buildingNumber: '',
              floorNumber: 0,
              notes: 'test',
              isDefault: false,
              createdAt: '',
            ));
    return Skeletonizer(
        containersColor: AppColors.white,
        enabled: true,
        child: DeliveryAddressListView(addresses: addresses));
  }
}
