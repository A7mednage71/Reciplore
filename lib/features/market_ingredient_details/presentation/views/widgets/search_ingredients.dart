import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';

class MarketSearchScreen extends StatelessWidget {
  const MarketSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search Ingredients'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: const Column(
          children: [
            //Results of response
          ],
        ),
      ),
    );
  }
}
