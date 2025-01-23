import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_grid_view.dart';
import 'package:looqma/features/search_recipes/presentation/views/widgets/search_result_length.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchResultLength(),
        SizedBox(height: 20.h),
        const Expanded(child: SearchRecipesGridView()),
      ],
    );
  }
}
