import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/combined/controllers/navigation_controller.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final itemWidth = context.screenWidth / 4;

    return Obx(
      () => Row(
        children: [
          _NavItem(
            width: itemWidth,
            label: AppStrings.home,
            icon: Icons.home_outlined,
            selected: controller.isHomeSelected,
            onTap: controller.goToHome,
          ),
          _NavItem(
            width: itemWidth,
            label: AppStrings.wallet,
            icon: Icons.attach_money,
            selected: controller.isWalletSelected,
            onTap: controller.goToWallet,
          ),
          _NavItem(
            width: itemWidth,
            label: AppStrings.badges,
            icon: Icons.emoji_events_outlined,
            selected: controller.isBadgesSelected,
            onTap: controller.goToBadges,
          ),
          _NavItem(
            width: itemWidth,
            label: AppStrings.profile,
            icon: Icons.person_outline,
            selected: controller.isProfileSelected,
            onTap: controller.goToProfile,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final double width;
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _NavItem({
    required this.width,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primaryGreen : AppColors.navUnselected;
    final iconSize = context.heightUnit * 2.8;
    return SizedBox(
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(iconSize),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.all(context.heightUnit * 0.8),
                  child: Icon(icon, size: iconSize, color: color),
                ),
              ),
            ),
            SizedBox(height: context.heightUnit * 0.6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: context.heightUnit * 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
