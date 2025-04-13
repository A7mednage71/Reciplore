import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/search_market_result_bloc_builder.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/search_market_textfield_and_filter.dart';

class SearchMarketScreen extends StatelessWidget {
  const SearchMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search Market'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const SearchMarketTextFieldAndFilter(),
            SizedBox(height: 20.h),
            const SearchMarketResultBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
