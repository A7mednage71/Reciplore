import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/ai_tools_item.dart';

enum RecipeGenerationType { ingredients, mood }

class ChatTextFieldAndSendButton extends StatefulWidget {
  const ChatTextFieldAndSendButton({
    super.key,
  });

  @override
  State<ChatTextFieldAndSendButton> createState() =>
      _ChatTextFieldAndSendButtonState();
}

class _ChatTextFieldAndSendButtonState
    extends State<ChatTextFieldAndSendButton> {
  RecipeGenerationType selectedType = RecipeGenerationType.ingredients;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatBotCubit>();
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: cubit.userMessageController,
            hintText: selectedType == RecipeGenerationType.ingredients
                ? 'Enter ingredients\n(comma separated)'
                : 'How are you feeling today?\n(e.g., happy, sad, etc.)',
            maxLines: 2,
            validator: null,
            contentPadding: EdgeInsets.all(10.w),
            suffixIcon: PopupMenuButton<String>(
              icon: const Icon(Icons.tune, color: AppColors.primaryDark),
              splashRadius: 30,
              onSelected: (value) {
                setState(() {
                  selectedType = value == ' ingredient'
                      ? RecipeGenerationType.ingredients
                      : RecipeGenerationType.mood;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: ' ingredient',
                  child: AiToolsItem(
                    icon: Icons.food_bank,
                    title: ' ingredient',
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Mood',
                  child: AiToolsItem(
                    icon: Icons.mood,
                    title: 'Mood',
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () => cubit.sendMessage(selectedType),
          icon: Transform.rotate(
            angle: -0.6,
            child: const Icon(
              Icons.send,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
