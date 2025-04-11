import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../widgets/chat_item.dart';
import '../utils/colors.dart';
import 'chat_detail_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChatModel> chats = ChatModel.sampleChats;

    return Scaffold(
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder:
            (context, index) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatItem(
            chat: chat,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChatDetailScreen(
                        name: chat.name,
                        avatar: chat.avatar,
                      ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open new chat screen
        },
        backgroundColor: AppColors.tealGreen,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
