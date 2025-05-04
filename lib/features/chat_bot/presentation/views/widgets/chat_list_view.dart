import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_state.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/assistant_message.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/empty_chat_widget.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/user_message.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({
    super.key,
  });

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

// Function to scroll to the bottom
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBotCubit, ChatBotState>(
      buildWhen: (previous, current) => previous.messages != current.messages,
      builder: (context, state) {
        final messages = state.messages;
        if (messages.isEmpty) {
          return const EmptyChatWidget();
        } else {
          _scrollToBottom();
        }
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.status == ChatBotStatus.loading
              ? messages.length + 1
              : messages.length,
          itemBuilder: (context, index) {
            if (index == messages.length &&
                state.status == ChatBotStatus.loading) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SpinKitThreeBounce(
                      size: 30.0,
                      color: AppColors.primaryMedium,
                    ),
                  ],
                ),
              );
            }
            final message = messages[index];
            return message.type == MessageType.user
                ? UserMessage(message: message)
                : AssistantMessage(message: message);
          },
        );
      },
    );
  }
}
