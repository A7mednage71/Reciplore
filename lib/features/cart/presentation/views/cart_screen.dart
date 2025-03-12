import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:looqma/features/cart/presentation/views/widgets/cart_total_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Cart'),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h),
        itemCount: 4,
        itemBuilder: (context, index) => const CartItem(),
      ),
      bottomNavigationBar: const CartTotalSection(),
    );
  }
}
