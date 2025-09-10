import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class TabSelector extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int>? onSelect;
  final bool underline;
  final TextStyle? textStyle;
  const TabSelector({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelect,
    this.underline = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (i) {
        final selected = i == selectedIndex;
        final style = (textStyle ??
                TextStyle(
                  fontSize: h * 1.8,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF396764),
                ))
            .copyWith(fontWeight: selected ? FontWeight.w600 : textStyle?.fontWeight ?? FontWeight.w500);
        final child = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(labels[i], style: style),
            if (underline && selected)
              Container(
                margin: EdgeInsets.only(top: h * 0.6),
                width: h * 2.4,
                height: 2,
                color: const Color(0xFF396764),
              ),
          ],
        );
        return onSelect == null
            ? child
            : InkWell(
                onTap: () => onSelect?.call(i),
                child: child,
              );
      }),
    );
  }
}