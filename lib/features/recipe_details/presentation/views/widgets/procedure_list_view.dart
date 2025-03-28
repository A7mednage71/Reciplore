import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/procedure_item.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/serve_numbers.dart';

class ProcedureListView extends StatefulWidget {
  const ProcedureListView({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  State<ProcedureListView> createState() => _ProcedureListViewState();
}

class _ProcedureListViewState extends State<ProcedureListView> {
  late List<String> procedureList;
  @override
  void initState() {
    super.initState();
    procedureList = widget.recipeModel.directions
        .split('.')
        .map((step) => step.trim())
        .where((step) => step.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServeNumbers(stepsIsCounted: true, length: procedureList.length),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: procedureList.length,
            itemBuilder: (context, index) {
              return ProcedureItem(
                stepNumber: index + 1,
                step: procedureList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
