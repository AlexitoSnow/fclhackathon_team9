import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/badges/models/badges_models.dart';

class BadgesController extends GetxController {
  // Observable variables
  final RxList<Badge> _lockedBadges = <Badge>[].obs;
  final RxList<CalendarDay> _calendarDays = <CalendarDay>[].obs;
  final Rx<MonthlyEarnings> _monthlyEarnings = const MonthlyEarnings(
    currentEarnings: 42.0,
    targetEarnings: 42.0,
    progress: 1.0,
  ).obs;

  // Getters
  List<Badge> get lockedBadges => _lockedBadges;
  List<CalendarDay> get calendarDays => _calendarDays;
  MonthlyEarnings get monthlyEarnings => _monthlyEarnings.value;

  @override
  void onInit() {
    super.onInit();
    _initializeLockedBadges();
    _initializeCalendarDays();
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void _initializeLockedBadges() {
    _lockedBadges.value = List.generate(2, (index) {
      return Badge(
        id: 'badge_$index',
        name: 'Locked Badge ${index + 1}',
        description: 'Complete challenges to unlock',
        isUnlocked: false,
        iconPath: '',
        requiredSteps: 1000 * (index + 1),
      );
    });
  }

  void _initializeCalendarDays() {
    final List<CalendarDay> days = [];

    // Generate 35 days for September calendar (5 empty + 30 days)
    for (int i = 0; i < 35; i++) {
      if (i < 5 || i > 34) {
        // Empty days at the beginning and end
        days.add(
          CalendarDay(day: 0, isCompleted: false, isCurrentMonth: false),
        );
      } else {
        // September days (1-30)
        days.add(
          CalendarDay(
            day: i - 4,
            isCompleted:
                false, // You can implement logic to check if day was completed
            isCurrentMonth: true,
          ),
        );
      }
    }

    _calendarDays.value = days;
  }

  void updateMonthlyEarnings(double current, double target) {
    final progress = target > 0 ? (current / target).clamp(0.0, 1.0) : 0.0;
    _monthlyEarnings.value = MonthlyEarnings(
      currentEarnings: current,
      targetEarnings: target,
      progress: progress,
    );
  }

  void completeDay(int dayNumber) {
    if (dayNumber >= 1 && dayNumber <= 30) {
      final index = dayNumber + 4; // Adjust for empty days at the beginning
      if (index < _calendarDays.length) {
        _calendarDays[index] = _calendarDays[index].copyWith(isCompleted: true);
        _calendarDays.refresh();
      }
    }
  }

  void unlockBadge(String badgeId) {
    final index = _lockedBadges.indexWhere((badge) => badge.id == badgeId);
    if (index != -1) {
      _lockedBadges[index] = _lockedBadges[index].copyWith(isUnlocked: true);
      _lockedBadges.refresh();
    }
  }

  String get earningsText =>
      '\$${_monthlyEarnings.value.currentEarnings.toInt()} / \$${_monthlyEarnings.value.targetEarnings.toInt()}';
  double get earningsProgress => _monthlyEarnings.value.progress;

  // Reactive getters for Obx
  String get earningsTextRx =>
      '\$${_monthlyEarnings.value.currentEarnings.toInt()} / \$${_monthlyEarnings.value.targetEarnings.toInt()}';
  double get earningsProgressRx => _monthlyEarnings.value.progress;
}
