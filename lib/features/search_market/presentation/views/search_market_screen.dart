import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/search_market_result_bloc_builder.dart';
import 'package:looqma/features/search_market/presentation/views/widgets/search_market_textfield_and_filter.dart';

class SearchMarketScreen extends StatelessWidget {
  const SearchMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Search Market'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            const SearchMarketTextFieldAndFilter(),
            SizedBox(height: 20.h),
            BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) =>
                  previous.status != CartStatus.cartActionSuccess &&
                  current.status == CartStatus.cartActionSuccess,
              listener: (context, state) {
                if (state.actionType == CartActionType.toggleItem) {
                  context
                      .read<SearchMarketCubit>()
                      .toggleInCartStatus(state.lastAffectedIngredientId!);
                }
              },
              child: const SearchMarketResultBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
