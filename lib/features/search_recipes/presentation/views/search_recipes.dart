import 'package:flutter/material.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_recipes_appbar.dart';

class SearchRecipes extends StatelessWidget {
  const SearchRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchRecipesAppBar(),
      body: Center(
        child: Text('Search Recipes'),
      ),
    );
  }
}
