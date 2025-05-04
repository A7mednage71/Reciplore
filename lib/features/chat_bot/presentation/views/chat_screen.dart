import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_bot_appbar.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_list_view.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_text_field_send_Button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const ChatBotAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              const Expanded(child: ChatListView()),
              SizedBox(height: 5.h),
              const ChatTextFieldAndSendButton(),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
