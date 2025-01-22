import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/home/presentation/views/widgets/search_recipe.dart';
import 'package:looqma/features/home/presentation/views/widgets/user_info.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 30.h),
        const UserInfo(),
        const SearchRecipe(),
      ],
    ));
  }
}
