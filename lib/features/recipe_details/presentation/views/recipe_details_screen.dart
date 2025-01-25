import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/dropdown_button.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/recipe_details_view.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/details_image.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 33.w),
            child: CustomDropdownButton(),
          ),
        ],
        leading: Padding(
          padding:  EdgeInsets.only(left: 30.w),
          child: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsImage(),
            SizedBox(height: 10.h),
            Text("Spicy chicken burger with\nFrench fries",
                style: AppStyles.smallBoldText),
            SizedBox(height: 10.h),
            RecipeDetailsView(),
          ],
        ),
      ),
    );
  }
}
