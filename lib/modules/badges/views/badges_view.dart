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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.streak,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: h * 2.8,
              ),
            ),
            SizedBox(height: h * 2),
            _buildLockedBadges(context, controller),
            SizedBox(height: h * 3),
            _buildCalendar(context, controller),
            SizedBox(height: h * 3),
            _buildEarnings(context, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildLockedBadges(BuildContext context, BadgesController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 4),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 1.5),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: controller.lockedBadges.map((badge) {
            return _buildLockedBadgeItem(context, badge.isUnlocked);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLockedBadgeItem(BuildContext context, bool isUnlocked) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      width: w * 25,
      height: w * 25,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(h * 1.5),
        border: Border.all(
          color: isUnlocked ? AppColors.primaryGreen : AppColors.trackGrey,
          style: BorderStyle.solid,
        ),
      ),
      child: Icon(
        isUnlocked ? Icons.check : Icons.lock,
        color: isUnlocked ? AppColors.primaryGreen : AppColors.trackGrey,
        size: h * 5,
      ),
    );
  }

  Widget _buildCalendar(BuildContext context, BadgesController controller) {
    final h = context.heightUnit;
    final w = context.widthUnit;
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.september,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: h * 2.2,
          ),
        ),
        SizedBox(height: h * 2),
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
        SizedBox(height: h * 1.5),
        Obx(
          () => Wrap(
            spacing: w * 4.5,
            runSpacing: h * 1.5,
            children: controller.calendarDays.map((day) {
              if (!day.isCurrentMonth) {
                // Empty days at the beginning and end
                return SizedBox(width: h * 3.5, height: h * 3.5);
              }

              return Container(
                width: h * 3.5,
                height: h * 3.5,
                decoration: BoxDecoration(
                  color: day.isCompleted
                      ? AppColors.primaryGreen
                      : const Color(
                          0xFFFDDDBB,
                        ), // Light orange color from image
                  shape: BoxShape.circle,
                ),
                child: day.isCompleted
                    ? Icon(
                        Icons.check,
                        color: AppColors.primaryDark,
                        size: h * 2,
                      )
                    : null,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEarnings(BuildContext context, BadgesController controller) {
    final h = context.heightUnit;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.earningThisMonth,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: h * 2.2,
          ),
        ),
        SizedBox(height: h * 2),
        Container(
          padding: EdgeInsets.all(h * 2),
          decoration: BoxDecoration(
            color: AppColors.lightSurface,
            borderRadius: BorderRadius.circular(h * 1.5),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Obx(
                    () => LinearProgressIndicator(
                      value: controller.earningsProgress,
                      minHeight: h * 2.5,
                      backgroundColor: AppColors.trackGrey,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryGreen,
                      ),
                      borderRadius: BorderRadius.circular(h * 1.25),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(h * 0.5),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryGreen,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.attach_money,
                      color: AppColors.primaryGreen,
                      size: h * 2.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 1),
              Align(
                alignment: Alignment.centerRight,
                child: Obx(
                  () => Text(
                    controller.earningsText,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: h * 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
