import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/core/common/widgets/warning_alert_dailog.dart';
import 'package:looqma/core/extensions/navigation_context.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/core/utils/app_styles.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';

class ChatBotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatBotAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatBotCubit>();
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text('ChatBot', style: AppStyles.mediumBoldText),
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => context.pop(),
        child: const Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryLight,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => WarningAlertDailog(
                    title: 'New Chat',
                    subtitle:
                        'Are you sure you want to delete this chat and start a new chat ?',
                    onConfirm: () {
                      cubit.clearChat();
                      context.pop();
                    },
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
