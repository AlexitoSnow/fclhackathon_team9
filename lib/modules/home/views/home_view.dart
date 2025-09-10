import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';
import 'dart:math' as math;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 5, vertical: h * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            SizedBox(height: h * 4),
            _buildProgressSection(context),
            SizedBox(height: h * 4),
            _buildSectionHeader(context, 'Streak', 'More'),
            SizedBox(height: h * 1.5),
            _buildStreakItems(context),
            SizedBox(height: h * 4),
            _buildSectionHeader(context, 'Badges', 'More'),
            SizedBox(height: h * 1.5),
            // Placeholder for Badges content
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
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
                Text(
                  '42',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: h * 2,
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

  Widget _buildProgressSection(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    const progress = 0.0;

    return Row(
      children: [
        SizedBox(
          width: w * 40,
          height: w * 40,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Transform.rotate(
                angle: math.pi / 2,
                child: CircularProgressIndicator(
                  value: 1,
                  strokeWidth: 12,
                  backgroundColor: AppColors.white,
                  color: AppColors.lightSurface,
                ),
              ),
              Transform.rotate(
                angle: math.pi / 2,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: AppColors.transparent,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.primaryGreen,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: h * 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: h * 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: w * 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(color: AppColors.textSecondary, fontSize: h * 2),
            ),
            Text(
              '0 steps',
              style: TextStyle(
                color: AppColors.primaryGreen,
                fontSize: h * 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Goal 5000 steps',
              style: TextStyle(color: AppColors.textSecondary, fontSize: h * 2),
            ),
          ],
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

  Widget _buildStreakItems(BuildContext context) {
    final w = context.widthUnit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return _buildStreakCard(context, '${index + 1}'.padLeft(2, '0'));
      }),
    );
  }

  Widget _buildStreakCard(BuildContext context, String day) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      width: w * 12,
      height: h * 7,
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 1.5),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: h * 2.2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
