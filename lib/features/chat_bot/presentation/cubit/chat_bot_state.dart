import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';

part 'chat_bot_state.freezed.dart';

enum ChatBotStatus { initial, loading, success, failure }

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState({
    @Default(ChatBotStatus.initial) ChatBotStatus status,
    @Default([]) List<ChatMessage> messages,
    String? errorMessage,
  }) = _ChatBotState;
}
