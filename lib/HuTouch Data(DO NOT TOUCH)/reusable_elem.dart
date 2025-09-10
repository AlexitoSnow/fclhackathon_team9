/*[
  {
    "name": "PrimaryGradientButton",
    "description": "A full-width button with blue gradient, used for primary CTAs such as 'Sign up', 'Let's plan', 'Book a trip now', 'Generate plan', 'Book room', 'Book ticket', 'Add to itinerary', 'Save'.",
    "standardization": "Dynamic label text, optional icon. Accepts onClick/onPress handler and disabled/loading state.",
    "styling_changes": "Height and horizontal padding may vary slightly; gradient stop/corner radius consistent, minor width changes.",
    "code": "// lib/shared/components/primary_gradient_button.dart\nimport 'package:flutter/material.dart';\nimport 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';\n\nclass PrimaryGradientButton extends StatelessWidget {\n  final String label;\n  final VoidCallback? onPressed;\n  final bool loading;\n  final bool enabled;\n  final Gradient? gradient;\n  const PrimaryGradientButton({\n    super.key,\n    required this.label,\n    required this.onPressed,\n    this.loading = false,\n    this.enabled = true,\n    this.gradient,\n  });\n\n  @override\n  Widget build(BuildContext context) {\n    final h = context.heightUnit;\n    final colors = gradient ??\n        const LinearGradient(colors: [Color(0xFF396764), Color(0xFF396764)], begin: Alignment.topLeft, end: Alignment.bottomRight);\n    return SizedBox(\n      height: h * 6.0,\n      width: double.infinity,\n      child: DecoratedBox(\n        decoration: BoxDecoration(\n          gradient: colors,\n          borderRadius: BorderRadius.circular(h * 3.0),\n        ),\n        child: Material(\n          color: Colors.transparent,\n          borderRadius: BorderRadius.circular(h * 3.0),\n          clipBehavior: Clip.antiAlias,\n          child: InkWell(\n            onTap: enabled && !loading ? onPressed : null,\n            child: Center(\n              child: loading\n                  ? SizedBox(\n                      width: h * 2.4,\n                      height: h * 2.4,\n                      child: const CircularProgressIndicator(\n                        strokeWidth: 2,\n                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),\n                      ),\n                    )\n                  : Text(\n                      label,\n                      style: TextStyle(\n                        color: const Color(0xFFFFFFFF),\n                        fontWeight: FontWeight.w600,\n                        fontSize: h * 2.2,\n                      ),\n                    ),\n            ),\n          ),\n        ),\n      ),\n    );\n  }\n}\n"
  },
  {
    "name": "OutlinedButton",
    "description": "A button with only border outline (no fill). Used for secondary actions such as 'Write a review', 'Upload a photo', 'View X reviews', 'Upcoming trip', 'Current trip', 'Past trips'.",
    "standardization": "Dynamic label text, accepts onClick/onPress handler. Optional icon before text.",
    "styling_changes": "Padding/margins may change slightly for group vs. standalone use; border color/tint might vary by theme.",
    "code": ""
  },
  {
    "name": "TabSelector",
    "description": "A horizontal group of selectable tabs (with underline for selection) used for segmenting content, e.g. days in itinerary, 'Recent/History' in Chatbot, 'Day 1/Day 2/...' in Expenses/Bookings/Generate Plan.",
    "standardization": "Accepts array of tab labels, 'selectedTab', and onTabSelect callback.",
    "styling_changes": "Underline color/weight and spacing between tabs may vary slightly.",
    "code": ""
  },
  {
    "name": "PlaceCard",
    "description": "Visual card for a place, featuring a rectangular image, title (e.g. 'Lake view cafe'), subtitle (distance), optional icon (like heart/bookmark), and tag (e.g. food, landmark, sun). Used in 'Suggested Places', 'Places near you', 'Popular places', etc.",
    "standardization": "Props: image, title, subtitle, icon type/state (filled/outline), category tag, distance, onCardPress action.",
    "styling_changes": "Appears in single or grid view; slight margin/padding adjustment; border shadow may vary.",
    "code": ""
  },
  {
    "name": "SearchInput",
    "description": "Rounded text input with search icon or placeholder, used for searching or entering queries (e.g. Home, Search, Generate Plan screens).",
    "standardization": "Accepts placeholder, value, onChange handler, and optional icon (search/filter).",
    "styling_changes": "Width/padding might vary based on context (full width vs. inset).",
    "code": "// lib/shared/components/search_input.dart\nimport 'package:flutter/material.dart';\nimport 'package:fclhackathon_team9/core/constants/app_colors.dart';\nimport 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';\n\nclass SearchInput extends StatelessWidget {\n  final TextEditingController controller;\n  final String? placeholder;\n  final ValueChanged<String>? onChanged;\n  final bool readOnly;\n  final bool showIcon;\n  const SearchInput({\n    super.key,\n    required this.controller,\n    this.placeholder,\n    this.onChanged,\n    this.readOnly = false,\n    this.showIcon = false,\n  });\n\n  @override\n  Widget build(BuildContext context) {\n    final h = context.heightUnit;\n    return SizedBox(\n      height: h * 5.2,\n      child: TextField(\n        controller: controller,\n        onChanged: onChanged,\n        readOnly: readOnly,\n        style: TextStyle(fontSize: h * 2.0, color: AppColors.primaryText),\n        decoration: InputDecoration(\n          hintText: placeholder,\n          prefixIcon: showIcon ? const Icon(Icons.search) : null,\n          isDense: true,\n          filled: true,\n          fillColor: AppColors.fieldBg,\n          contentPadding: EdgeInsets.symmetric(horizontal: h * 2.0, vertical: h * 1.6),\n          border: OutlineInputBorder(\n            borderRadius: BorderRadius.circular(h * 2.2),\n            borderSide: BorderSide.none,\n          ),\n        ),\n      ),\n    );\n  }\n}\n"
  },
  {
    "name": "HorizontalIconMenuButton",
    "description": "Square or rounded icon buttons with a label underneath, used for quick access actions such as 'Stay', 'Eat', 'Landmarks', 'Live events' and dashboard quick actions like 'To see', 'To do', 'Bookings', 'Packing list', 'Transport', 'Transit', 'Expenses', 'Docs'.",
    "standardization": "Takes icon type, label, and onClick/onPress as parameters. Optionally supports fill vs. outline.",
    "styling_changes": "Icon or box size may vary, but proportion, color, and label font remain consistent; possible spacing changes.",
    "code": ""
  },
  {
    "name": "ListItemCard",
    "description": "Horizontal list item with image thumbnail, title, subtitle (address, description), secondary icons (price, stars, etc.). Used for hotel/event listings, search/filter results.",
    "standardization": "Props: image, title, description/subtitle, icons (price, rating, bookmark), onCardPress handler.",
    "styling_changes": "Thumb image ratio or secondary icon arrangement may vary by entity type.",
    "code": ""
  },
  {
    "name": "BackHeader",
    "description": "Top bar with back arrow and page title, used in sub-pages like 'Notifications', 'Search', 'Stay', 'Live Events', 'Expenses', etc.",
    "standardization": "Accepts dynamic title, optional right-side action/icons, and onBack callback.",
    "styling_changes": "Title left margin and icon spacing may slightly vary.",
    "code": "// lib/shared/components/back_header.dart\nimport 'package:flutter/material.dart';\nimport 'package:get/get.dart';\nimport 'package:fclhackathon_team9/core/constants/app_colors.dart';\nimport 'package:fclhackathon_team9/utils/extensions/context_extensions.dart';\n\nclass BackHeader extends StatelessWidget {\n  final String title;\n  final VoidCallback? onBack;\n  final Widget? rightAction;\n  const BackHeader({super.key, required this.title, this.onBack, this.rightAction});\n\n  @override\n  Widget build(BuildContext context) {\n    final h = context.heightUnit;\n    final w = context.widthUnit;\n    return Padding(\n      padding: EdgeInsets.symmetric(horizontal: w * 4.0),\n      child: Row(\n        children: [\n          Material(\n            color: Colors.transparent,\n            clipBehavior: Clip.antiAlias,\n            child: InkWell(\n              borderRadius: BorderRadius.circular(h * 5),\n              onTap: onBack ?? () => Get.back(),\n              child: Padding(\n                padding: EdgeInsets.all(h * 1.2),\n                child: Icon(Icons.chevron_left, color: AppColors.primaryText, size: h * 4.0),\n              ),\n            ),\n          ),\n          SizedBox(width: w * 1.5),\n          Expanded(\n            child: Text(\n              title,\n              style: TextStyle(\n                color: AppColors.primaryText,\n                fontWeight: FontWeight.w600,\n                fontSize: h * 3.2,\n              ),\n            ),\n          ),\n          if (rightAction != null) rightAction!,\n        ],\n      ),\n    );\n  }\n}\n"
  },
  {
    "name": "ReviewCard",
    "description": "A card-like tile for user reviews, featuring circular avatar, username, star rating, short review content, and date. Seen in Stay/Event detail pages.",
    "standardization": "Props: avatar image, username, review text, star count, date, optional like/share action.",
    "styling_changes": "Text truncation length and avatar size can be adjusted slightly.",
    "code": ""
  },
  {
    "name": "StampsGrid",
    "description": "Visual grid/list of travel 'stamps' (badges), each with an image and label, used in Travel Journal, Profile, and various stamp sections.",
    "standardization": "Accepts array of stamp data: image, label, (optionally: locked/unlocked state).",
    "styling_changes": "May show with different padding or row spacing according to context.",
    "code": ""
  }
]*/