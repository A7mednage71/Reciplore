import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/core/utils/app_assets.dart';
import 'package:looqma/features/home/presentation/views/widgets/filter_button.dart';

class SearchRecipeSection extends StatelessWidget {
  const SearchRecipeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: TextEditingController(),
              validator: null,
              onChanged: (value) => null,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              keyboardType: TextInputType.text,
              prefixIcon: Image.asset(
                AppAssets.imagesSearchIcon,
                height: 20.h,
                width: 20.w,
              ),
              hintText: "Search recipe",
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.searchScreen);
              },
            ),
          ),
          SizedBox(width: 20.w),
          const FilterButton(),
        ],
      ),
    );
  }
}
