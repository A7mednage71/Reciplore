import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShowNewRecipesLoading extends StatelessWidget {
  const ShowNewRecipesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 200.h,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
              child: const NewRecipesItem(recipeModel: null),
            );
          },
        ),
      ),
    );
  }
}
