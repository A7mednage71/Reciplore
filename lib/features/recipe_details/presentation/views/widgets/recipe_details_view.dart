import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/ingredients_list_view.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/num_of_ingredients.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/procedure_list_view.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView>
    with TickerProviderStateMixin {
  late TabController _clickController;

  @override
  void initState() {
    super.initState();
    _clickController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _clickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            isScrollable: false,
            tabs: const [
              Tab(text: 'Ingredients'),
              Tab(text: 'Procedure'),
            ],
            controller: _clickController,
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.primaryDark,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.fill,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 22.h,),
         NumOfIngredients(),
          SizedBox(height: 20.h,),
          SizedBox(
            height: 200,
            child: TabBarView(
        physics: AlwaysScrollableScrollPhysics(),

              controller: _clickController,
              children: const [
                IngredientsListView(),
                ProcedureListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
