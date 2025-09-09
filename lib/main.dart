import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/bindings/app_bindings.dart';
import 'package:fclhackathon_team9/core/theme/app_theme.dart';
import 'package:fclhackathon_team9/modules/combined/views/combined_screens.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel wallet value',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      theme: AppTheme.light,
      home: const CombinedScreens(),
    );
  }
}
