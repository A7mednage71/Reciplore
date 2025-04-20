import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:looqma/features/chat_bot/data/models/chat_bot_request_model.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';
import 'package:looqma/features/chat_bot/data/repos/chat_bot_repo.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotRepo _chatBotRepo;

  ChatBotCubit(this._chatBotRepo) : super(const ChatBotState.initial());

  TextEditingController userMessageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  Future<void> sendMessage() async {
    final userInput = userMessageController.text.trim();
    if (userInput.isEmpty) return;

    final userMessage = ChatMessage.fromUser(userInput);
    _messages.add(userMessage);
    emit(ChatBotState.success(List.from(_messages)));

    userMessageController.clear();

    emit(const ChatBotState.loading());

    try {
      final response = await _chatBotRepo.chatBot(
        message: ChatBotRequestModel(
          ingredients: userInput,
        ),
      );
      response.when(success: (responseData) {
        final botMessage = ChatMessage.fromBot(
          responseData.suggestion,
          imageUrl: responseData.image,
        );
        _messages.add(botMessage);
        emit(ChatBotState.success(List.from(_messages)));
      }, failure: (error) {
        final errorMessage = ChatMessage.fromBot(error.errMessages);
        _messages.add(errorMessage);
        // emit(ChatBotState.error(error.errMessages));
        emit(ChatBotState.success(List.from(_messages)));
      });
    } catch (e) {
      final errorMessage =
          ChatMessage.fromBot(e.toString());
      _messages.add(errorMessage);
      // emit(ChatBotState.error(e.toString()));
      emit(ChatBotState.success(List.from(_messages)));
    }
  }

  void clearChat() {
    _messages.clear();
    emit(const ChatBotState.initial());
  }
}
//Sorry, I had trouble finding a recipe. Please try again.
