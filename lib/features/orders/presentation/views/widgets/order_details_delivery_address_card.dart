import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/extensions/address_ex.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/orders/data/models/get_orders_response_model.dart';
import 'package:looqma/features/orders/presentation/views/widgets/order_delivery_address_row.dart';

class OrderDetailsDeliveryAddressCard extends StatelessWidget {
  const OrderDetailsDeliveryAddressCard({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDeliveryAddressRow(
                label: "Address Label",
                value: order.deliveryAddress.addressLabel,
              ),
              SizedBox(height: 5.h),
              OrderDeliveryAddressRow(
                label: "City",
                value:
                    "${order.deliveryAddress.city} , ${order.deliveryAddress.country}",
              ),
              SizedBox(height: 5.h),
              OrderDeliveryAddressRow(
                label: "Full Address",
                value: order.deliveryAddress.fullAddress,
              ),
              SizedBox(height: 5.h),
              OrderDeliveryAddressRow(
                label: "Postal Code",
                value: order.deliveryAddress.postalCode.toString(),
              ),
              SizedBox(height: 5.h),
              OrderDeliveryAddressRow(
                  label: "Phone", value: order.contactNumber),
            ],
          ),
        ),
      ),
    );
  }
}
