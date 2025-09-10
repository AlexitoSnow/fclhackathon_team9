import 'package:flutter/material.dart';
import 'package:fclhackathon_team9/core/constants/app_colors.dart';
import 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool showIcon;
  const SearchInput({
    super.key,
    required this.controller,
    this.placeholder,
    this.onChanged,
    this.readOnly = false,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final h = context.heightUnit;
    return SizedBox(
      height: h * 5.2,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        style: TextStyle(fontSize: h * 2.0, color: AppColors.primaryText),
        decoration: InputDecoration(
          hintText: placeholder,
          prefixIcon: showIcon ? const Icon(Icons.search) : null,
          isDense: true,
          filled: true,
          fillColor: AppColors.fieldBg,
          contentPadding: EdgeInsets.symmetric(horizontal: h * 2.0, vertical: h * 1.6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(h * 2.2),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}