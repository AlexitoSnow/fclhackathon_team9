import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/core/constants/app_dimensions.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class BalancePill extends StatelessWidget {
  final String amountText;
  final VoidCallback onTap;
  const BalancePill({super.key, required this.amountText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final radius = h * AppDimensions.radiusUnit;
    final height = h * AppDimensions.pillHeightUnit;
    final iconSize = h * (AppDimensions.iconUnit + 0.6);

    return Material(
      color: AppColors.primaryGreen,
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.attach_money, color: AppColors.textPrimary, size: iconSize),
              SizedBox(width: context.widthUnit * 2.2),
              Text(
                amountText,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: h * 2.2,
                ),
              ),
              SizedBox(width: context.widthUnit * 1.0),
            ],
          ),
        ),
      ),
    );
  }
}
