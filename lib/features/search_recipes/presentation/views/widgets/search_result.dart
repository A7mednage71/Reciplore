import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_view.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_result_length.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.recipes});
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchResultLength(searchResultLength: recipes.length),
        SizedBox(height: 10.h),
        Expanded(child: SearchRecipesGridView(recipes: recipes)),
        SizedBox(height: 5.h),
      ],
    );
  }
}
