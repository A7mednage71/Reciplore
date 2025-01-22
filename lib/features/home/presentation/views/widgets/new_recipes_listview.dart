import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/new_recipes_item.dart';

class NewRecipesListView extends StatelessWidget {
  const NewRecipesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 15.w),
            child: const NewRecipesItem(),
          );
        },
      ),
    );
  }
}
