class ChatModel {
  final String name;
  final String avatar;
  final String message;
  final String time;
  final bool isRead;
  final int unreadCount;
  final bool isGroup;

  ChatModel({
    required this.name,
    required this.avatar,
    required this.message,
    required this.time,
    required this.isRead,
    this.unreadCount = 0,
    this.isGroup = false,
  });

  // Sample data for testing
  static List<ChatModel> get sampleChats => [
    ChatModel(
      name: "John Doe",
      avatar: "https://randomuser.me/api/portraits/men/1.jpg",
      message: "Hey! How are you doing?",
      time: "12:30 PM",
      isRead: true,
    ),
    ChatModel(
      name: "Alice Smith",
      avatar: "https://randomuser.me/api/portraits/women/2.jpg",
      message: "Don't forget about the meeting tomorrow",
      time: "11:45 AM",
      isRead: false,
      unreadCount: 2,
    ),
    ChatModel(
      name: "Family Group",
      avatar:
          "https://randomuser.me/api/portraits/men/3.jpg", // Group icon can be added later
      message: "Mom: Let's plan something for the weekend",
      time: "10:20 AM",
      isRead: true,
      isGroup: true,
    ),
    ChatModel(
      name: "Sarah Johnson",
      avatar: "https://randomuser.me/api/portraits/women/4.jpg",
      message: "The documents are ready for review",
      time: "9:15 AM",
      isRead: false,
      unreadCount: 1,
    ),
    ChatModel(
      name: "Project Team",
      avatar: "https://randomuser.me/api/portraits/men/5.jpg",
      message: "David: Let's schedule a call to discuss the new features",
      time: "Yesterday",
      isRead: true,
      isGroup: true,
    ),
    ChatModel(
      name: "Michael Brown",
      avatar: "https://randomuser.me/api/portraits/men/6.jpg",
      message: "Will you be joining us for dinner?",
      time: "Yesterday",
      isRead: true,
    ),
    ChatModel(
      name: "Emily Wilson",
      avatar: "https://randomuser.me/api/portraits/women/7.jpg",
      message: "The presentation went really well!",
      time: "Yesterday",
      isRead: true,
    ),
    ChatModel(
      name: "Tech Support",
      avatar: "https://randomuser.me/api/portraits/men/8.jpg",
      message: "Your ticket has been updated",
      time: "10/12/2023",
      isRead: true,
    ),
    ChatModel(
      name: "School Friends",
      avatar: "https://randomuser.me/api/portraits/women/9.jpg",
      message: "James: Who's up for a reunion next month?",
      time: "10/10/2023",
      isRead: true,
      isGroup: true,
    ),
    ChatModel(
      name: "Dr. Johnson",
      avatar: "https://randomuser.me/api/portraits/men/10.jpg",
      message: "Your appointment is confirmed for tomorrow at 3 PM",
      time: "9/28/2023",
      isRead: true,
    ),
  ];
}
