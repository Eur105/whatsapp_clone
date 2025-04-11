// status_screen.dart - Modified to use the renamed StatusTile widget
import 'package:flutter/material.dart';
import '../models/status_model.dart';
import '../widgets/status_item.dart'; // Still importing from the same file
import '../utils/colors.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<StatusModel> allStatus = StatusModel.sampleStatus;

    // Separate my status and other statuses
    final myStatus = allStatus.isNotEmpty ? allStatus[0] : null;
    final otherStatus =
        allStatus.length > 1 ? allStatus.sublist(1) : <StatusModel>[];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // My Status
            if (myStatus != null)
              StatusTile(
                // Changed from StatusItem to StatusTile
                status: myStatus,
                onTap: () {
                  // Open add status screen
                },
                isMyStatus: true,
              ),

            const Divider(),

            // Recent updates heading
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Recent updates",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            ),

            // Other statuses
            for (var status in otherStatus)
              StatusTile(
                // Changed from StatusItem to StatusTile
                status: status,
                onTap: () {
                  // Open status view screen
                },
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Edit text status button
          FloatingActionButton(
            onPressed: () {
              // Open text status editor
            },
            mini: true,
            backgroundColor: Colors.grey[200],
            child: const Icon(
              Icons.edit,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 16),

          // Camera for status button
          FloatingActionButton(
            onPressed: () {
              // Open camera for status
            },
            backgroundColor: AppColors.tealGreen,
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
