import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_cubit.dart';
import 'package:looqma/features/diet_plan/presentation/views/widgets/diet_plan_goal_chip.dart';

class DietPlanGoalsList extends StatefulWidget {
  const DietPlanGoalsList({super.key});

  @override
  State<DietPlanGoalsList> createState() => _DietPlanGoalsListState();
}

class _DietPlanGoalsListState extends State<DietPlanGoalsList> {
  int active = -1;
  final List<String> dietPlanGoals = [
    "Muscle Gain",
    "Weight Loss",
    "Maintainance",
  ];
  @override
  Widget build(BuildContext context) {
    final dietPlanCubit = context.read<DietPlanCubit>();
    return Wrap(
      spacing: 10.w,
      runSpacing: 5.h,
      children: dietPlanGoals.asMap().entries.map((goal) {
        return InkWell(
          onTap: () {
            if (active != goal.key) {
              setState(() {
                active = goal.key;
                dietPlanCubit.changeGoal(goal.value);
              });
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: DietPlanGoalChip(
            goal: goal.value,
            isActive: active == goal.key,
          ),
        );
      }).toList(),
    );
  }
}
