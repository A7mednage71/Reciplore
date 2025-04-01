import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      // child: ListView.builder(
      //   itemCount: 10,
      //   scrollDirection: Axis.horizontal,
      //   physics: const BouncingScrollPhysics(),
      //   padding: EdgeInsets.only(left: 20.w, right: 20.w),
      //   itemBuilder: (context, index) => Padding(
      //     padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
      //     child: GestureDetector(
      //         onTap: () {
      //           Navigator.of(context, rootNavigator: true)
      //               .pushNamed(Routes.marketIngredientsDetails);
      //         },
      //         child: const MarketIngredientItem()),
      //   ),
      // ),
    );
  }
}
