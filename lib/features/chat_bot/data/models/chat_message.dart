class ChatMessage {
  final String content;
  final bool isUserMessage;
  final String? imageUrl;
  final DateTime timestamp;

  ChatMessage({
    required this.content,
    required this.isUserMessage,
    this.imageUrl,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory ChatMessage.fromUser(String content) {
    return ChatMessage(
      content: content,
      isUserMessage: true,
    );
  }

  factory ChatMessage.fromBot(String content, {String? imageUrl}) {
    return ChatMessage(
      content: content,
      isUserMessage: false,
      imageUrl: imageUrl,
    );
  }
}
