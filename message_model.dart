class MessageModel {
  final String content;
  final String timestamp;
  final bool isMe;
  final bool isRead;
  final MessageType type;

  MessageModel({
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.isRead = false,
    this.type = MessageType.text,
  });

  // Sample data for testing
  static List<MessageModel> get sampleMessages => [
    MessageModel(
      content: "Hey! How are you doing?",
      timestamp: "12:30 PM",
      isMe: false,
      isRead: true,
    ),
    MessageModel(
      content: "I'm good! Just working on the new project. How about you?",
      timestamp: "12:32 PM",
      isMe: true,
      isRead: true,
    ),
    MessageModel(
      content: "Same here. The deadline is approaching fast though.",
      timestamp: "12:33 PM",
      isMe: false,
      isRead: true,
    ),
    MessageModel(
      content:
          "Yes, I've been working on it all week. Do you want to meet up to discuss it?",
      timestamp: "12:35 PM",
      isMe: true,
      isRead: true,
    ),
    MessageModel(
      content: "That would be great! How about tomorrow at the coffee shop?",
      timestamp: "12:36 PM",
      isMe: false,
      isRead: true,
    ),
    MessageModel(
      content: "Perfect. Let's meet at 10 AM?",
      timestamp: "12:38 PM",
      isMe: true,
      isRead: true,
    ),
    MessageModel(
      content: "Sounds good! See you then.",
      timestamp: "12:39 PM",
      isMe: false,
      isRead: true,
    ),
    MessageModel(
      content: "https://picsum.photos/300/200",
      timestamp: "12:45 PM",
      isMe: true,
      isRead: true,
      type: MessageType.image,
    ),
    MessageModel(
      content: "Nice picture! Is that from your vacation?",
      timestamp: "12:47 PM",
      isMe: false,
      isRead: true,
    ),
    MessageModel(
      content: "Yes! It was amazing.",
      timestamp: "12:48 PM",
      isMe: true,
      isRead: false,
    ),
  ];
}

enum MessageType { text, image, video, audio, file }
