import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView>
    with TickerProviderStateMixin {
  @override
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: EdgeInsets.only(left: 30.w),
          isScrollable: true,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'indian'),
            Tab(text: 'chinese'),
            Tab(text: 'italian'),
            Tab(text: 'mexican'),
            Tab(text: 'american'),
          ],
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.primaryDark,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: (value) {},
        ),
        SizedBox(height: 70.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 30.w),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
                child: const RecipeItem(),
              );
            },
          ),
        ),
      ],
    );
  }
}
