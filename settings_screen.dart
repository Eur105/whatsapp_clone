import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // User info section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Avatar
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.lightGreyColor,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/lego/1.jpg",
                  ),
                ),
                const SizedBox(width: 16),

                // User details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Your Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Status message goes here...",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // QR Code icon
                IconButton(
                  icon: const Icon(
                    Icons.qr_code,
                    color: AppColors.tealGreen,
                    size: 28,
                  ),
                  onPressed: () {
                    // Open QR code screen
                  },
                ),
              ],
            ),
          ),

          const Divider(),

          // Account
          _buildSettingItem(
            icon: Icons.key,
            iconBgColor: AppColors.keyIconBg,
            title: "Account",
            subtitle: "Privacy, security, change number",
            onTap: () {},
          ),

          // Chats
          _buildSettingItem(
            icon: Icons.chat,
            iconBgColor: AppColors.chatIconBg,
            title: "Chats",
            subtitle: "Theme, wallpapers, chat history",
            onTap: () {},
          ),

          // Notifications
          _buildSettingItem(
            icon: Icons.notifications,
            iconBgColor: AppColors.notificationIconBg,
            title: "Notifications",
            subtitle: "Message, group & call tones",
            onTap: () {},
          ),

          // Storage and data
          _buildSettingItem(
            icon: Icons.data_usage,
            iconBgColor: AppColors.storageIconBg,
            title: "Storage and data",
            subtitle: "Network usage, auto-download",
            onTap: () {},
          ),

          // Help
          _buildSettingItem(
            icon: Icons.help,
            iconBgColor: AppColors.helpIconBg,
            title: "Help",
            subtitle: "Help center, contact us, privacy policy",
            onTap: () {},
          ),

          // Invite a friend
          _buildSettingItem(
            icon: Icons.group_add,
            iconBgColor: AppColors.inviteIconBg,
            title: "Invite a friend",
            subtitle: "",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle:
          subtitle.isNotEmpty
              ? Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              )
              : null,
      onTap: onTap,
    );
  }
}
