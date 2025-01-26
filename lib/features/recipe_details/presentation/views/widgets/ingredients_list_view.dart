import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/ingredients_item.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/serve_numbers.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ServeNumbers(stepsIsCounted: false),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const IngredientsItem();
            },
          ),
        ),
      ],
    );
  }
}
