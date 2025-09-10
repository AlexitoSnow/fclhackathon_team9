import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_strings.dart';
import 'package:fclhackathon_team9/modules/home/controllers/home_controller.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context, controller),
            SizedBox(height: h * 4),
            _buildProgressSection(context, controller),
            SizedBox(height: h * 4),
            _buildSectionHeader(context, AppStrings.streak, AppStrings.more),
            SizedBox(height: h * 1.5),
            _buildStreakItems(context, controller),
            SizedBox(height: h * 4),
            _buildSectionHeader(context, AppStrings.badges, AppStrings.more),
            SizedBox(height: h * 1.5),
            _buildBadgesSection(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, HomeController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Padding(
      padding: EdgeInsets.only(top: h * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: w * 3, vertical: h * 1),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(h * 2),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: AppColors.primaryDark,
                  size: h * 2.5,
                ),
                SizedBox(width: w * 1),
                Obx(
                  () => Text(
                    controller.balanceText,
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                      fontSize: h * 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(h * 1),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              borderRadius: BorderRadius.circular(h * 1.5),
            ),
            child: Icon(
              Icons.notifications,
              color: AppColors.primaryDark,
              size: h * 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(
    BuildContext context,
    HomeController controller,
  ) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Row(
      children: [
        // Circular Progress Indicator - Much larger
        SizedBox(
          width: w * 50,
          height: w * 50,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background circle
              CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 12,
                backgroundColor: AppColors.trackGrey,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.trackGrey,
                ),
              ),
              // Progress circle
              Obx(
                () => CircularProgressIndicator(
                  value: controller.progress,
                  strokeWidth: 12,
                  backgroundColor: AppColors.transparent,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryGreen,
                  ),
                ),
              ),
              // Center content
              Center(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.progressPercentage,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: h * 4.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppStrings.completed,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: h * 2.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: w * 6),
        // Today's progress info
        Expanded(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.today,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: h * 2.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: h * 1),
                Text(
                  controller.stepsText,
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontSize: h * 3.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: h * 1),
                Text(
                  '${AppStrings.goal} ${controller.goalSteps} ${AppStrings.steps}',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: h * 2.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    String actionText,
  ) {
    final h = context.heightUnit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: h * 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          actionText,
          style: TextStyle(
            color: AppColors.primaryGreen,
            fontSize: h * 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildStreakItems(BuildContext context, HomeController controller) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          final dayNumber = (index + 1).toString().padLeft(2, '0');
          final isCompleted = index == 0; // First day is completed
          return _buildStreakCard(context, dayNumber, isCompleted);
        }),
      ),
    );
  }

  Widget _buildStreakCard(BuildContext context, String day, bool isCompleted) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Container(
      width: w * 14,
      height: h * 8,
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color(0xFFE8E8E8) // Slightly darker grey for completed
            : const Color(0xFFF5F5F5), // Light grey for incomplete
        borderRadius: BorderRadius.circular(h * 1.2),
        border: Border.all(
          color: isCompleted
              ? const Color(0xFFD0D0D0)
              : const Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: h * 2.4,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildBadgesSection(BuildContext context, HomeController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Row(
      children: List.generate(4, (index) {
        return Container(
          width: w * 18,
          height: h * 12,
          margin: EdgeInsets.only(right: w * 2),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(h * 1.5),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: const Color(0xFF9E9E9E), size: h * 4),
              SizedBox(height: h * 1),
              Text(
                'Badge ${index + 1}',
                style: TextStyle(
                  color: const Color(0xFF9E9E9E),
                  fontSize: h * 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
