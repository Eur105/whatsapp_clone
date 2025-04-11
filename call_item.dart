import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/call_model.dart';
import '../utils/colors.dart';

class CallItem extends StatelessWidget {
  final CallModel call;
  final Function() onTap;

  const CallItem({Key? key, required this.call, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.lightGreyColor,
              backgroundImage: CachedNetworkImageProvider(call.avatar),
            ),
            const SizedBox(width: 16),

            // Call details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    call.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          call.isMissed
                              ? AppColors.missedCallRed
                              : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      call.callDirectionIcon,
                      const SizedBox(width: 4),
                      Text(
                        call.time,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Call button
            IconButton(
              icon: Icon(call.callIcon, color: AppColors.tealGreen),
              onPressed: () {
                // Make a call
              },
            ),
          ],
        ),
      ),
    );
  }
}
