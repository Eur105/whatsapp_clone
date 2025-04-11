class StatusModel {
  final String name;
  final String avatar;
  final String time;
  final bool isViewed;
  final List<StatusItem> items;

  StatusModel({
    required this.name,
    required this.avatar,
    required this.time,
    this.isViewed = false,
    this.items = const [],
  });

  // Sample data for testing
  static List<StatusModel> get sampleStatus => [
    // My status (first one is always the user's status)
    StatusModel(
      name: "My Status",
      avatar: "https://randomuser.me/api/portraits/lego/1.jpg",
      time: "Tap to add status update",
      items: [],
    ),

    // Others status
    StatusModel(
      name: "John Doe",
      avatar: "https://randomuser.me/api/portraits/men/1.jpg",
      time: "Today, 10:30 AM",
      isViewed: false,
      items: [
        StatusItem(
          type: StatusType.image,
          content: "https://picsum.photos/400/800",
          caption: "Beautiful day!",
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
      ],
    ),
    StatusModel(
      name: "Alice Smith",
      avatar: "https://randomuser.me/api/portraits/women/2.jpg",
      time: "Today, 9:15 AM",
      isViewed: false,
      items: [
        StatusItem(
          type: StatusType.text,
          content: "Out enjoying the weather today!",
          backgroundColor: 0xFF128C7E,
          timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        ),
      ],
    ),
    StatusModel(
      name: "Sarah Johnson",
      avatar: "https://randomuser.me/api/portraits/women/4.jpg",
      time: "Today, 8:45 AM",
      isViewed: true,
      items: [
        StatusItem(
          type: StatusType.image,
          content: "https://picsum.photos/400/800?random=1",
          caption: "Morning coffee ☕",
          timestamp: DateTime.now().subtract(const Duration(hours: 4)),
        ),
      ],
    ),
    StatusModel(
      name: "Michael Brown",
      avatar: "https://randomuser.me/api/portraits/men/6.jpg",
      time: "Yesterday, 11:30 PM",
      isViewed: true,
      items: [
        StatusItem(
          type: StatusType.text,
          content: "What a game!",
          backgroundColor: 0xFF075E54,
          timestamp: DateTime.now().subtract(const Duration(hours: 12)),
        ),
      ],
    ),
    StatusModel(
      name: "Emily Wilson",
      avatar: "https://randomuser.me/api/portraits/women/7.jpg",
      time: "Yesterday, 8:20 PM",
      isViewed: true,
      items: [
        StatusItem(
          type: StatusType.image,
          content: "https://picsum.photos/400/800?random=2",
          caption: "Dinner with friends",
          timestamp: DateTime.now().subtract(const Duration(hours: 15)),
        ),
      ],
    ),
  ];
}

class StatusItem {
  final StatusType type;
  final String content;
  final String? caption;
  final int? backgroundColor; // For text status
  final DateTime timestamp;

  StatusItem({
    required this.type,
    required this.content,
    this.caption,
    this.backgroundColor,
    required this.timestamp,
  });
}

enum StatusType { text, image, video }
