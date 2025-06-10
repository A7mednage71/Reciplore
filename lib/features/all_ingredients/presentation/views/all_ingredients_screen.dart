import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/all_ingredients/presentation/views/widgets/all_ingredients_grid_view.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';

class AllIngredientsScreen extends StatefulWidget {
  const AllIngredientsScreen({super.key});

  @override
  State<AllIngredientsScreen> createState() => _AllIngredientsScreenState();
}

class _AllIngredientsScreenState extends State<AllIngredientsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<HomeMarketCubit>();
    final currentState = cubit.state;

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.6 &&
        !currentState.isFetching &&
        currentState.hasNextPage) {
      cubit.getIngredients();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Ingredients'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: AllIngredientsGridView(scrollController: _scrollController),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10.w),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryDarker,
            onPressed: _scrollToTop,
            child: const Icon(Icons.arrow_upward, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
