import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/badges/controllers/badges_controller.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

  @override
  Widget build(BuildContext context) {
    final BadgesController controller = Get.put(BadgesController());
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        // Show error snackbar if there's an error
        if (controller.errorMessage.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.snackbar(
              'Error',
              controller.errorMessage,
              backgroundColor: Colors.red.shade100,
              colorText: Colors.red.shade800,
              snackPosition: SnackPosition.TOP,
              margin: const EdgeInsets.all(16),
              borderRadius: 8,
            );
          });
        }

        return RefreshIndicator(
          onRefresh: controller.refreshBadgesData,
          color: AppColors.primaryGreen,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section with locked badges
                _buildHeaderSection(context, controller),
                SizedBox(height: h * 4),
                // Calendar section
                _buildCalendarSection(context, controller),
                SizedBox(height: h * 4),
                // Earnings section
                _buildEarningsSection(context, controller),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    BadgesController controller,
  ) {
    final h = context.heightUnit;

    return Container(
      height: h * 25, // Header section height
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 2),
      ),
      child: Center(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.lockedBadges.map((badge) {
              return _buildHexagonalBadge(context, badge.isUnlocked);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildHexagonalBadge(BuildContext context, bool isUnlocked) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Container(
      width: w * 20,
      height: w * 20,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(h * 2),
        border: Border.all(color: AppColors.trackGrey, width: 1),
      ),
      child: Icon(Icons.lock, color: AppColors.trackGrey, size: h * 4),
    );
  }

  Widget _buildCalendarSection(
    BuildContext context,
    BadgesController controller,
  ) {
    final h = context.heightUnit;
    final daysOfWeek = [
      AppStrings.sun,
      AppStrings.mon,
      AppStrings.tue,
      AppStrings.wed,
      AppStrings.thu,
      AppStrings.fri,
      AppStrings.sat,
    ];

    return Column(
      children: [
        // Month title
        Text(
          AppStrings.september,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: h * 2.4,
          ),
        ),
        SizedBox(height: h * 3),
        // Days of week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysOfWeek
              .map(
                (day) => Text(
                  day,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: h * 2),
        // Activity grid
        _buildActivityGrid(context, controller),
      ],
    );
  }

  Widget _buildActivityGrid(BuildContext context, BadgesController controller) {
    final h = context.heightUnit;

    // Create 6 rows with 7 circles each (42 total circles)
    return Column(
      children: List.generate(6, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(bottom: h * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (colIndex) {
              final dayIndex = rowIndex * 7 + colIndex;
              final isActive = dayIndex < 36; // First 36 days are active

              return Container(
                width: h * 3.5,
                height: h * 3.5,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFFFDDDBB) // Light orange/peach color
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildEarningsSection(
    BuildContext context,
    BadgesController controller,
  ) {
    final h = context.heightUnit;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Text(
          AppStrings.earningThisMonth,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: h * 2.4,
          ),
        ),
        SizedBox(height: h * 3),
        // Progress bar with coin icon
        _buildProgressBar(context, controller),
        SizedBox(height: h * 2),
        // Progress amount
        Align(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              controller.earningsTextRx,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: h * 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: h * 2),
        // Motivational text
        RichText(
          text: TextSpan(
            style: TextStyle(color: AppColors.textPrimary, fontSize: h * 1.6),
            children: [
              const TextSpan(text: 'You have '),
              TextSpan(
                text: '\$${controller.monthlyEarnings.currentEarnings.toInt()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: ' by staying active. Keep it up to earn even more!',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context, BadgesController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // Background progress bar
        Container(
          height: h * 2.5,
          decoration: BoxDecoration(
            color: AppColors.trackGrey,
            borderRadius: BorderRadius.circular(h * 1.25),
          ),
        ),
        // Green progress fill
        Container(
          height: h * 2.5,
          width: w * 100, // Full width to show 100% completion
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(h * 1.25),
          ),
        ),
        // Golden coin icon at the end
        Container(
          padding: EdgeInsets.all(h * 0.3),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD700), // Golden color
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFFD700).withValues(alpha: 0.3),
                blurRadius: h * 1,
                spreadRadius: h * 0.5,
              ),
            ],
          ),
          child: Icon(
            Icons.attach_money,
            color: AppColors.white,
            size: h * 2.2,
          ),
        ),
      ],
    );
  }
}
