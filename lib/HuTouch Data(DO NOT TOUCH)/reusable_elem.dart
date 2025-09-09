/*[
  {
    "name": "PrimaryGradientButton",
    "description": "A full-width button with blue gradient, used for primary CTAs such as 'Sign up', 'Let's plan', 'Book a trip now', 'Generate plan', 'Book room', 'Book ticket', 'Add to itinerary', 'Save'.",
    "standardization": "Dynamic label text, optional icon. Accepts onClick/onPress handler and disabled/loading state.",
    "styling_changes": "Height and horizontal padding may vary slightly; gradient stop/corner radius consistent, minor width changes."
  },
  {
    "name": "OutlinedButton",
    "description": "A button with only border outline (no fill). Used for secondary actions such as 'Write a review', 'Upload a photo', 'View X reviews', 'Upcoming trip', 'Current trip', 'Past trips'.",
    "standardization": "Dynamic label text, accepts onClick/onPress handler. Optional icon before text.",
    "styling_changes": "Padding/margins may change slightly for group vs. standalone use; border color/tint might vary by theme."
  },
  {
    "name": "TabSelector",
    "description": "A horizontal group of selectable tabs (with underline for selection) used for segmenting content, e.g. days in itinerary, 'Recent/History' in Chatbot, 'Day 1/Day 2/...' in Expenses/Bookings/Generate Plan.",
    "standardization": "Accepts array of tab labels, 'selectedTab', and onTabSelect callback.",
    "styling_changes": "Underline color/weight and spacing between tabs may vary slightly."
  },
  {
    "name": "PlaceCard",
    "description": "Visual card for a place, featuring a rectangular image, title (e.g. 'Lake view cafe'), subtitle (distance), optional icon (like heart/bookmark), and tag (e.g. food, landmark, sun). Used in 'Suggested Places', 'Places near you', 'Popular places', etc.",
    "standardization": "Props: image, title, subtitle, icon type/state (filled/outline), category tag, distance, onCardPress action.",
    "styling_changes": "Appears in single or grid view; slight margin/padding adjustment; border shadow may vary."
  },
  {
    "name": "SearchInput",
    "description": "Rounded text input with search icon or placeholder, used for searching or entering queries (e.g. Home, Search, Generate Plan screens).",
    "standardization": "Accepts placeholder, value, onChange handler, and optional icon (search/filter).",
    "styling_changes": "Width/padding might vary based on context (full width vs. inset)."
  },
  {
    "name": "HorizontalIconMenuButton",
    "description": "Square or rounded icon buttons with a label underneath, used for quick access actions such as 'Stay', 'Eat', 'Landmarks', 'Live events' and dashboard quick actions like 'To see', 'To do', 'Bookings', 'Packing list', 'Transport', 'Transit', 'Expenses', 'Docs'.",
    "standardization": "Takes icon type, label, and onClick/onPress as parameters. Optionally supports fill vs. outline.",
    "styling_changes": "Icon or box size may vary, but proportion, color, and label font remain consistent; possible spacing changes."
  },
  {
    "name": "ListItemCard",
    "description": "Horizontal list item with image thumbnail, title, subtitle (address, description), secondary icons (price, stars, etc.). Used for hotel/event listings, search/filter results.",
    "standardization": "Props: image, title, description/subtitle, icons (price, rating, bookmark), onCardPress handler.",
    "styling_changes": "Thumb image ratio or secondary icon arrangement may vary by entity type."
  },
  {
    "name": "BackHeader",
    "description": "Top bar with back arrow and page title, used in sub-pages like 'Notifications', 'Search', 'Stay', 'Live Events', 'Expenses', etc.",
    "standardization": "Accepts dynamic title, optional right-side action/icons, and onBack callback.",
    "styling_changes": "Title left margin and icon spacing may slightly vary."
  },
  {
    "name": "ReviewCard",
    "description": "A card-like tile for user reviews, featuring circular avatar, username, star rating, short review content, and date. Seen in Stay/Event detail pages.",
    "standardization": "Props: avatar image, username, review text, star count, date, optional like/share action.",
    "styling_changes": "Text truncation length and avatar size can be adjusted slightly."
  },
  {
    "name": "StampsGrid",
    "description": "Visual grid/list of travel 'stamps' (badges), each with an image and label, used in Travel Journal, Profile, and various stamp sections.",
    "standardization": "Accepts array of stamp data: image, label, (optionally: locked/unlocked state).",
    "styling_changes": "May show with different padding or row spacing according to context."
  }
]*/