import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_dimensions.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class EarningsCard extends StatelessWidget {
  final double progress;
  final String progressLabel;
  const EarningsCard({super.key, required this.progress, required this.progressLabel});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    final radius = h * AppDimensions.radiusUnit;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.symmetric(horizontal: w * 4.2, vertical: h * 2.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              progressLabel,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: h * 1.72,
              ),
            ),
          ),
          SizedBox(height: h * 1.6),
          LayoutBuilder(
            builder: (context, constraints) {
              final trackHeight = h * AppDimensions.progressHeightUnit;
              final fillWidth = constraints.maxWidth * progress;
              return Stack(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: trackHeight,
                    decoration: BoxDecoration(
                      color: AppColors.trackGrey,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    width: fillWidth,
                    height: trackHeight,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
