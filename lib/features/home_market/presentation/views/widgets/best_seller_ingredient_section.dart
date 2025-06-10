import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/best_seller_list_view.dart';

class BestSellerIngredientsSection extends StatelessWidget {
  const BestSellerIngredientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text('Best Sellers', style: AppStyles.mediumBoldText),
        ),
        SizedBox(height: 10.h),
        const BestSellerListView(),
      ],
    );
  }
}
