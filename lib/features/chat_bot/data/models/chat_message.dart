enum MessageType { user, bot }

class ChatMessage {
  final String content;
  final MessageType type;
  final String? imageUrl;
  final DateTime timestamp;

  ChatMessage({
    required this.content,
    required this.type,
    this.imageUrl,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory ChatMessage.fromUser(String content) {
    return ChatMessage(
      content: content,
      type: MessageType.user,
    );
  }

  factory ChatMessage.fromBot(String content, {String? imageUrl}) {
    return ChatMessage(
      content: content,
      type: MessageType.bot,
      imageUrl: imageUrl,
    );
  }
}
