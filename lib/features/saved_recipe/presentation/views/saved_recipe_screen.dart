import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/saved_recipe/presentation/views/widgets/saved_recipe_item.dart';

class SavedRecipeScreen extends StatelessWidget {
  const SavedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Text('Saved recipes', style: AppStyles.mediumBoldText),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(Routes.showRecipeDetails);
                    },
                    child: const SavedRecipeItem());
              },
            ),
          ),
        ],
      ),
    );
  }
}
