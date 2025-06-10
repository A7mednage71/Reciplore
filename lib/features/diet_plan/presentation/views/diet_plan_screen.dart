import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/core/utils/my_validator.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_cubit.dart';
import 'package:looqma/features/diet_plan/presentation/views/widgets/create_plan_button.dart';
import 'package:looqma/features/diet_plan/presentation/views/widgets/diet_plan_goals_list.dart';
import 'package:looqma/features/diet_plan/presentation/views/widgets/select_gender.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dietPlanCubit = context.read<DietPlanCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: "Diet Plan"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Form(
            key: dietPlanCubit.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Hello 👋 , Ready to take charge of your health?  Let’s plan your diet! 🥗",
                    style: AppStyles.smallBoldText),
                SizedBox(height: 20.h),
                const SelectGender(),
                SizedBox(height: 20.h),
                Text("Your Body Details :", style: AppStyles.smallBoldText),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: dietPlanCubit.heightController,
                        validator: MyValidators.heightValidator,
                        keyboardType: TextInputType.number,
                        hintText: "Height (cm)",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextField(
                        controller: dietPlanCubit.weightController,
                        validator: MyValidators.weightValidator,
                        keyboardType: TextInputType.number,
                        hintText: "Weight (kg)",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: dietPlanCubit.ageController,
                        validator: MyValidators.ageValidator,
                        keyboardType: TextInputType.number,
                        hintText: "Age",
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextField(
                        controller: dietPlanCubit.fatController,
                        validator: MyValidators.fatPercentageValidator,
                        keyboardType: TextInputType.number,
                        hintText: "Fat %",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text("Your Diet Goals :", style: AppStyles.smallBoldText),
                SizedBox(height: 10.h),
                const DietPlanGoalsList(),
                SizedBox(height: 20.h),
                Text("Your Diet Preferences :", style: AppStyles.smallBoldText),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: dietPlanCubit.preferencesController,
                  validator: MyValidators.requiredValidator,
                  keyboardType: TextInputType.text,
                  hintText: "Preferences",
                ),
                SizedBox(height: 20.h),
                const CreatePlanButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
