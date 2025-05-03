import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_request_model.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';
import 'package:looqma/features/chat_bot/data/repos/chat_bot_repo.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepo _chatBotRepo;

  ChatBotCubit(this._chatBotRepo) : super(const ChatBotState());

  TextEditingController userMessageController = TextEditingController();

  Future<void> sendMessage() async {
    final userInput = userMessageController.text.trim();
    if (userInput.isEmpty) return;

    final userMessage = ChatMessage.fromUser(userInput);

    emit(state.copyWith(
        messages: [...state.messages, userMessage],
        status: ChatBotStatus.loading));

    userMessageController.clear();

    final response = await _chatBotRepo.chatBotRecommendation(
      message: ChatBotRequestModel(ingredients: userInput),
    );

    response.when(success: (chatBotResponse) {
      final botMessage = ChatMessage.fromBot(
        chatBotResponse.recipeMarkdown,
        imageUrl: chatBotResponse.image,
      );

      emit(state.copyWith(
          messages: [...state.messages, botMessage],
          status: ChatBotStatus.success));
    }, failure: (error) {
      final errorMessage = ChatMessage.fromBot(error.errMessages);
      emit(state.copyWith(
          messages: [...state.messages, errorMessage],
          status: ChatBotStatus.failure));
    });
  }

  void clearChat() {
    emit(state.copyWith(messages: []));
  }
}
