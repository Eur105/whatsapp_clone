import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CallModel {
  final String name;
  final String avatar;
  final String time;
  final CallDirection direction;
  final CallType type;
  final bool isMissed;

  CallModel({
    required this.name,
    required this.avatar,
    required this.time,
    required this.direction,
    this.type = CallType.voice,
    this.isMissed = false,
  });

  // Returns the appropriate icon and color based on call properties
  IconData get callIcon {
    if (type == CallType.video) {
      return Icons.videocam;
    } else {
      return Icons.call;
    }
  }

  Color get callIconColor {
    if (isMissed) {
      return AppColors.missedCallRed;
    } else if (direction == CallDirection.incoming) {
      return AppColors.incomingCallGreen;
    } else {
      return AppColors.outgoingCallBlue;
    }
  }

  Icon get callDirectionIcon {
    IconData iconData;

    if (direction == CallDirection.incoming) {
      iconData = isMissed ? Icons.call_missed : Icons.call_received;
    } else {
      iconData = Icons.call_made;
    }

    return Icon(
      iconData,
      size: 16,
      color: isMissed ? AppColors.missedCallRed : Colors.grey,
    );
  }

  // Sample data for testing
  static List<CallModel> get sampleCalls => [
    CallModel(
      name: "John Doe",
      avatar: "https://randomuser.me/api/portraits/men/1.jpg",
      time: "10 minutes ago",
      direction: CallDirection.incoming,
      type: CallType.voice,
    ),
    CallModel(
      name: "Alice Smith",
      avatar: "https://randomuser.me/api/portraits/women/2.jpg",
      time: "30 minutes ago",
      direction: CallDirection.outgoing,
      type: CallType.video,
    ),
    CallModel(
      name: "Sarah Johnson",
      avatar: "https://randomuser.me/api/portraits/women/4.jpg",
      time: "Today, 10:30 AM",
      direction: CallDirection.incoming,
      type: CallType.voice,
      isMissed: true,
    ),
    CallModel(
      name: "Michael Brown",
      avatar: "https://randomuser.me/api/portraits/men/6.jpg",
      time: "Today, 9:15 AM",
      direction: CallDirection.outgoing,
      type: CallType.voice,
    ),
    CallModel(
      name: "Emily Wilson",
      avatar: "https://randomuser.me/api/portraits/women/7.jpg",
      time: "Yesterday, 8:45 PM",
      direction: CallDirection.incoming,
      type: CallType.video,
    ),
    CallModel(
      name: "David Clark",
      avatar: "https://randomuser.me/api/portraits/men/8.jpg",
      time: "Yesterday, 7:30 PM",
      direction: CallDirection.incoming,
      type: CallType.voice,
      isMissed: true,
    ),
    CallModel(
      name: "Sophie Miller",
      avatar: "https://randomuser.me/api/portraits/women/9.jpg",
      time: "Yesterday, 6:15 PM",
      direction: CallDirection.outgoing,
      type: CallType.video,
    ),
    CallModel(
      name: "James Taylor",
      avatar: "https://randomuser.me/api/portraits/men/10.jpg",
      time: "Yesterday, 3:45 PM",
      direction: CallDirection.outgoing,
      type: CallType.voice,
    ),
  ];
}

enum CallDirection { incoming, outgoing }

enum CallType { voice, video }
