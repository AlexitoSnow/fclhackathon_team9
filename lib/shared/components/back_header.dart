import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class BackHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? rightAction;
  const BackHeader({super.key, required this.title, this.onBack, this.rightAction});

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final w = context.widthUnit;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 4.0),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              borderRadius: BorderRadius.circular(h * 5),
              onTap: onBack ?? () => Get.back(),
              child: Padding(
                padding: EdgeInsets.all(h * 1.2),
                child: Icon(Icons.chevron_left, color: AppColors.primaryText, size: h * 4.0),
              ),
            ),
          ),
          SizedBox(width: w * 1.5),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
                fontSize: h * 3.2,
              ),
            ),
          ),
          if (rightAction != null) rightAction!,
        ],
      ),
    );
  }
}
