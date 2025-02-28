import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/empty_state.dart';
import 'package:looqma/core/common/widgets/failure_state.dart';
import 'package:looqma/features/home/presentation/cubit/get_recipes/get_recipes_by_country/get_recipes_by_country_cubit.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_recipes_by_country_list_view.dart';
import 'package:looqma/features/home/presentation/views/widgets/show_recipes_by_country_loading.dart';

class ShowRecipesByCountryBlocBuilder extends StatelessWidget {
  const ShowRecipesByCountryBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<GetRecipesByCountryCubit, GetRecipesByCountryState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            failure: (message) => FailureState(hight: 50.h, message: message),
            loading: () {
              return const ShowRecipesByCountryLoading();
            },
            success: (recipes) {
              if (recipes.isEmpty) {
                return const Center(child: EmptyState());
              }
              return ShowRecipesByCountryListView(recipes: recipes);
            },
          );
        },
      ),
    );
  }
}
