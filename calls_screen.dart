import 'package:flutter/material.dart';
import '../models/call_model.dart';
import '../widgets/call_item.dart';
import '../utils/colors.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CallModel> calls = CallModel.sampleCalls;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Create call link
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.tealGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.link, color: Colors.white, size: 28),
              ),
              title: const Text(
                "Create call link",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: const Text(
                "Share a link for your WhatsApp call",
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                // Create call link
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Recent calls",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),

          // Call list
          Expanded(
            child: ListView.separated(
              itemCount: calls.length,
              separatorBuilder:
                  (context, index) => const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) {
                final call = calls[index];
                return CallItem(
                  call: call,
                  onTap: () {
                    // View call details or redial
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open new call screen
        },
        backgroundColor: AppColors.tealGreen,
        child: const Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }
}
