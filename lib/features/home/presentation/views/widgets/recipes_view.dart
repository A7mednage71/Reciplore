import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_countries_widget_bloc_builder.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_recipes_by_country_list_view.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShowCountriesWidgetBlocBuilder(),
        SizedBox(height: 70.h),
        const ShowRecipesByCountryListView(),
      ],
    );
  }
}
