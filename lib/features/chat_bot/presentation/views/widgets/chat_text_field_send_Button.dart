import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/custom_text_field.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';

class ChatTextFieldAndSendButton extends StatelessWidget {
  const ChatTextFieldAndSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatBotCubit>();

    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: cubit.userMessageController,
            hintText: 'Enter ingredients (comma separated)',
            maxLines: 1,
            validator: null,
            contentPadding: EdgeInsets.all(10.w),
          ),
        ),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () => cubit.sendMessage(),
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
