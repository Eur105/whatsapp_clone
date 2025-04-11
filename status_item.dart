// status_item.dart - Modified to fix the name conflict
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/status_model.dart';
import '../utils/colors.dart';

class StatusTile extends StatelessWidget {
  // Renamed from StatusItem to StatusTile
  final StatusModel status;
  final Function() onTap;
  final bool isMyStatus;

  const StatusTile({
    // Also updated constructor name
    Key? key,
    required this.status,
    required this.onTap,
    this.isMyStatus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Status avatar with border
            Stack(
              children: [
                // Border container
                isMyStatus ? _buildAddStatusAvatar() : _buildStatusAvatar(),

                // Add button for my status
                if (isMyStatus)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.tealGreen,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 16),

            // Status details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusAvatar() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: status.isViewed
              ? AppColors.viewedStatusBorderColor
              : AppColors.statusBorderColor,
          width: 2,
        ),
      ),
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.lightGreyColor,
        backgroundImage: CachedNetworkImageProvider(status.avatar),
      ),
    );
  }

  Widget _buildAddStatusAvatar() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColors.lightGreyColor,
      backgroundImage: CachedNetworkImageProvider(status.avatar),
    );
  }
}
