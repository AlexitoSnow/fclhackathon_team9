import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class OutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;
  const OutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.borderColor = const Color(0xFF396764),
    this.textColor = const Color(0xFF396764),
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return SizedBox(
      height: h * 3.8,
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: StadiumBorder(side: BorderSide(color: borderColor, width: 1)),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: h * 2.0, color: textColor),
                  SizedBox(width: h * 0.8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: h * 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}