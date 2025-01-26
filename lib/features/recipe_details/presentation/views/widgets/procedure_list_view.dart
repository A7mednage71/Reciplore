import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/procedure_item.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/serve_numbers.dart';

class ProcedureListView extends StatelessWidget {
  const ProcedureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ServeNumbers(stepsIsCounted: true),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return const ProcedureItem();
            },
          ),
        ),
      ],
    );
  }
}
