import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/assistant_message.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_bot_appbar.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_text_field_send_Button.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/empty_chat_widget.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/user_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatBotAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            Expanded(
              child: false
                  ? ListView.builder(
                      controller: ScrollController(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // message.role == Role.user
                        return index % 2 == 0
                            ? const UserMessage()
                            : const AssistantMessage();
                      },
                    )
                  : const EmptyChatWidget(),
            ),
            const ChatTextFieldAndSendButton(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
