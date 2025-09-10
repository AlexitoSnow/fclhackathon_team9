import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_dimensions.dart';
import 'package:fclhackathon_team9/modules/combined/controllers/combined_controller.dart';
import 'package:fclhackathon_team9/modules/combined/widgets/bottom_nav_bar.dart';
import 'package:fclhackathon_team9/modules/home/views/home_view.dart';
import 'package:fclhackathon_team9/modules/wallet/views/wallet_view.dart';
import 'package:fclhackathon_team9/modules/badges/views/badges_view.dart';
import 'package:fclhackathon_team9/modules/profile/views/profile_view.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class CombinedScreens extends StatelessWidget {
  const CombinedScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CombinedController>();
    final pages = <Widget>[
      const HomeView(),
      const WalletView(),
      const BadgesView(),
      const ProfileView(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Obx(() => pages[controller.currentIndex.value])),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: AppColors.primaryDark),
        height: context.heightUnit * AppDimensions.bottomNavHeightUnit,
        child: SafeArea(top: false, child: const BottomNavBar()),
      ),
    );
  }
}
