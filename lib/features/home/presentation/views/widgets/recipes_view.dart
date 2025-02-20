import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/home/presentation/views/widgets/recipe_item.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_countries_widget_bloc_builder.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShowCountriesWidgetBlocBuilder(),
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
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(Routes.showRecipeDetails);
                    },
                    child: const RecipeItem()),
              );
            },
          ),
        ),
      ],
    );
  }
}
