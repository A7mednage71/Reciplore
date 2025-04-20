import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looqma/features/chat_bot/data/models/chat_message.dart';

part 'chat_bot_state.freezed.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initial() = _Initial;

  const factory ChatBotState.loading() = _Loading;

  const factory ChatBotState.error(String errorMessage) = _Error;

  const factory ChatBotState.success(List<ChatMessage> messages) = _Success;
}
