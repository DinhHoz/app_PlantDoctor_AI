// lib/features/my_garden/presentation/widgets/reminders_tab.dart
import 'package:flutter/material.dart';

class RemindersTab extends StatelessWidget {
  const RemindersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("No reminders 😔", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          const Text("Tap to add your first reminder"),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Navigate to Add Reminder
            },
            icon: const Icon(Icons.alarm),
            label: const Text("Add Reminder"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(fontSize: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
