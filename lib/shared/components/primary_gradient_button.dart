import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class PrimaryGradientButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool enabled;
  final Gradient? gradient;
  const PrimaryGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.enabled = true,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    final colors = gradient ??
        const LinearGradient(colors: [Color(0xFF396764), Color(0xFF396764)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    return SizedBox(
      height: h * 6.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: colors,
          borderRadius: BorderRadius.circular(h * 3.0),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(h * 3.0),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: enabled && !loading ? onPressed : null,
            child: Center(
              child: loading
                  ? SizedBox(
                      width: h * 2.4,
                      height: h * 2.4,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                      ),
                    )
                  : Text(
                      label,
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: h * 2.2,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}