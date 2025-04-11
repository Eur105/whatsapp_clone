import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/chat_model.dart';
import '../utils/colors.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  final Function() onTap;

  const ChatItem({Key? key, required this.chat, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.lightGreyColor,
              backgroundImage: CachedNetworkImageProvider(chat.avatar),
            ),
            const SizedBox(width: 16),

            // Chat details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name
                      Text(
                        chat.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Time
                      Text(
                        chat.time,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              chat.unreadCount > 0
                                  ? AppColors.tealGreen
                                  : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Message and unread count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Message
                      Expanded(
                        child: Text(
                          chat.message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                chat.unreadCount > 0
                                    ? Colors.black
                                    : Colors.grey[600],
                          ),
                        ),
                      ),

                      // Read status or unread count
                      if (chat.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.tealGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      else if (chat.isRead && chat.message != "")
                        const Icon(
                          Icons.done_all,
                          size: 16,
                          color: AppColors.tealGreen,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
