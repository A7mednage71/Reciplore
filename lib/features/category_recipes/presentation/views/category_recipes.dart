import 'package:flutter/material.dart';

class CategoryRecipes extends StatelessWidget {
  const CategoryRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Recipes'),
      ),
      body: const Center(
        child: Text('Category Recipes'),
      ),
    );
  }
}
