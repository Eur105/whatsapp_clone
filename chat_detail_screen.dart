import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/message_model.dart';
import '../utils/colors.dart';
import '../widgets/message_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String avatar;

  const ChatDetailScreen({
    Key? key,
    required this.name,
    required this.avatar,
  }) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<MessageModel> _messages = MessageModel.sampleMessages;
  // bool _showEmoji = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        MessageModel(
          content: _messageController.text.trim(),
          timestamp: "Just now",
          isMe: true,
          isRead: false,
        ),
      );
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tealGreenDark,
        titleSpacing: 0,
        leadingWidth: 25,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.lightGreyColor,
              backgroundImage: CachedNetworkImageProvider(widget.avatar),
            ),
            const SizedBox(width: 8),
            Text(widget.name),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Messages list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _messages.length,
                reverse: false,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return MessageBubble(message: message);
                },
              ),
            ),

            // Input area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.white,
              child: Row(
                children: [
                  /*IconButton(
                    icon: Icon(
                      _showEmoji ? Icons.keyboard : Icons.emoji_emotions,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() {
                        _showEmoji = !_showEmoji;
                      });
                    },
                  ),*/
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                        ),
                        onChanged: (text) {
                          // Handle text change
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Show attachment options
                    },
                  ),
                  IconButton(
                    icon: _messageController.text.trim().isEmpty
                        ? const Icon(
                            Icons.mic,
                            color: AppColors.tealGreen,
                          )
                        : const Icon(
                            Icons.send,
                            color: AppColors.tealGreen,
                          ),
                    onPressed: _messageController.text.trim().isEmpty
                        ? () {
                            // Start voice recording
                          }
                        : _sendMessage,
                  ),
                ],
              ),
            ),

            // Emoji picker (placeholder)
            /*if (_showEmoji)
              Container(
                height: 250,
                color: Colors.white,
                child: const Center(
                  child: Text("Emoji Picker"),
                ),
              ),
            */
          ],
        ),
      ),
    );
  }
}
