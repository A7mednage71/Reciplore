import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_state.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/assistant_message.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_bot_appbar.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/chat_text_field_send_Button.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/empty_chat_widget.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/loading_chat_bot.dart';
import 'package:looqma/features/chat_bot/presentation/views/widgets/user_message.dart';
import 'package:lottie/lottie.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Add a post-frame callback to scroll to bottom after initial build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<ChatBotCubit>().messages.isNotEmpty) {
        _scrollToBottom();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatBotAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: BlocBuilder<ChatBotCubit, ChatBotState>(
          // buildWhen: (previous, current) {
          //   previous.
          // },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: state.when(
                    initial: () => const EmptyChatWidget(),
                    loading: () {
                      final message = context.read<ChatBotCubit>().messages;
                      return message.isEmpty
                          ? const LoadingChatBot()
                          : _buildMessageList(message);
                    },
                    success: (messages) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (messages.isNotEmpty) {
                          _scrollToBottom();
                        }
                      });
                      return messages.isEmpty
                          ? const EmptyChatWidget()
                          : _buildMessageList(messages);
                    },
                    error: (_) {
                      final messages = context.read<ChatBotCubit>().messages;
                      return messages.isEmpty
                          ? const EmptyChatWidget()
                          : _buildMessageList(messages);
                    },
                  ),
                ),
                const ChatTextFieldAndSendButton(),
                SizedBox(height: 10.h),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessageList(List<ChatMessage> messages) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.all(16.r),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return message.isUserMessage
            ? UserMessage(message: message)
            : AssistantMessage(message: message);
      },
    );
  }
}
