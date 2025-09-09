import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.transactions)),
      body: const Center(child: Text('No transactions yet')),
    );
  }
}
