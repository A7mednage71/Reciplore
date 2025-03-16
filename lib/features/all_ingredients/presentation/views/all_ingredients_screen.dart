import 'package:flutter/material.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/features/all_ingredients/presentation/views/widgets/all_ingredients_grid_view.dart';

class AllIngredientsScreen extends StatelessWidget {
  const AllIngredientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'All Ingredients'),
      body: AllIngredientsGridView(),
    );
  }
}
