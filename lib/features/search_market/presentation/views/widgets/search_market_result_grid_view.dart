import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/features/home_market/presentation/views/widgets/market_ingredient_item.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';

class MarketSearchResultGridView extends StatefulWidget {
  const MarketSearchResultGridView({
    super.key,
    required this.ingredients,
  });
  final List<IngredientDataModel> ingredients;

  @override
  State<MarketSearchResultGridView> createState() =>
      _MarketSearchResultGridViewState();
}

class _MarketSearchResultGridViewState
    extends State<MarketSearchResultGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<SearchMarketCubit>();
    final currentState = cubit.state;
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.7 &&
        !currentState.isFetching &&
        currentState.hasNextPage) {
      cubit.searchIngredients();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: widget.ingredients.length,
        controller: _scrollController,
        padding: EdgeInsets.all(5.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context, rootNavigator: true)
              //     .pushNamed(Routes.marketIngredientsDetails, arguments: {
              //   'ingredient': state.ingredients[index],
              //   'cartCubit': cartCubit,
              //   'homeMarketCubit': homeMarketCubit
              // });
            },
            child: AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: 2,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FadeInAnimation(
                  child: MarketIngredientItem(
                    ingredient: widget.ingredients[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
