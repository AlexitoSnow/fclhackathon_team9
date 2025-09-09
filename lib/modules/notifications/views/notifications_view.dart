import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.notifications)),
      body: const Center(child: Text('No notifications')),
    );
  }
}
