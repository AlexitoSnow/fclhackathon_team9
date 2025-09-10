import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

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
            Text(
              'Streak',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: h * 2.8,
              ),
            ),
            SizedBox(height: h * 2),
            _buildLockedBadges(context),
            SizedBox(height: h * 3),
            _buildCalendar(context),
            SizedBox(height: h * 3),
            _buildEarnings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLockedBadges(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      padding: EdgeInsets.symmetric(vertical: h * 2, horizontal: w * 4),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(h * 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLockedBadgeItem(context),
          _buildLockedBadgeItem(context),
        ],
      ),
    );
  }

  Widget _buildLockedBadgeItem(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Container(
      width: w * 25,
      height: w * 25,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(h * 1.5),
        border: Border.all(
          color: AppColors.trackGrey,
          style: BorderStyle.solid,
        ),
      ),
      child: Icon(Icons.lock, color: AppColors.trackGrey, size: h * 5),
    );
  }

  Widget _buildCalendar(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    final daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'September',
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
        // Generates 30 days for September, starting on a Friday (index 5)
        Wrap(
          spacing: w * 4.5,
          runSpacing: h * 1.5,
          children: List.generate(35, (index) {
            if (index < 5 || index > 34) {
              // Placeholder for empty days
              return SizedBox(width: h * 3.5, height: h * 3.5);
            }
            return Container(
              width: h * 3.5,
              height: h * 3.5,
              decoration: const BoxDecoration(
                color: Color(0xFFFDDDBB), // Light orange color from image
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildEarnings(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Earning this month',
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
                  LinearProgressIndicator(
                    value: 1.0, // Full progress
                    minHeight: h * 2.5,
                    backgroundColor: AppColors.trackGrey,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.primaryGreen,
                    ),
                    borderRadius: BorderRadius.circular(h * 1.25),
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
                child: Text(
                  '\$42 / \$42',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: h * 1.8,
                    fontWeight: FontWeight.w500,
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
