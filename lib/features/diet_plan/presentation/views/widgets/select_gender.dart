import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_cubit.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({
    super.key,
  });

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String selectedGender = '';
  @override
  Widget build(BuildContext context) {
    final dietPlanCubit = context.read<DietPlanCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Select Gender : ", style: AppStyles.smallBoldText),
        Wrap(
          spacing: 8.0,
          children: [
            ChoiceChip(
              label: const Text('Male'),
              selected: selectedGender == Gender.male.name,
              onSelected: (bool selected) {
                setState(() {
                  selectedGender = Gender.male.name;
                  dietPlanCubit.changeGender(Gender.male);
                });
              },
            ),
            ChoiceChip(
              label: const Text('Female'),
              selected: selectedGender == Gender.female.name,
              onSelected: (bool selected) {
                setState(() {
                  selectedGender = Gender.female.name;
                  dietPlanCubit.changeGender(Gender.female);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
