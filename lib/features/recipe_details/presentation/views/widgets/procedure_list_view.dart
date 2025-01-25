import 'package:flutter/material.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/procedure_item.dart';

class ProcedureListView extends StatelessWidget {
  const ProcedureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ProcedureItem();
      },
    );
  }
}
