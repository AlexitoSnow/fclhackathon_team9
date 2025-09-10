import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/home/models/home_models.dart';

class HomeController extends GetxController {
  // Observable variables
  final RxDouble _progress = 0.0.obs;
  final RxInt _currentSteps = 0.obs;
  final RxInt _goalSteps = 5000.obs;
  final RxInt _balance = 42.obs;
  final RxList<StreakDay> _streakDays = <StreakDay>[].obs;

  // Getters
  double get progress => _progress.value;
  int get currentSteps => _currentSteps.value;
  int get goalSteps => _goalSteps.value;
  int get balance => _balance.value;
  List<StreakDay> get streakDays => _streakDays;

  @override
  void onInit() {
    super.onInit();
    _initializeStreakDays();
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void _initializeStreakDays() {
    _streakDays.value = List.generate(6, (index) {
      return StreakDay(day: '${index + 1}'.padLeft(2, '0'), isCompleted: false);
    });
  }

  void updateProgress(double newProgress) {
    _progress.value = newProgress.clamp(0.0, 1.0);
  }

  void updateSteps(int steps) {
    _currentSteps.value = steps;
    _updateProgressFromSteps();
  }

  void _updateProgressFromSteps() {
    if (_goalSteps.value > 0) {
      _progress.value = (_currentSteps.value / _goalSteps.value).clamp(
        0.0,
        1.0,
      );
    }
  }

  void updateGoal(int newGoal) {
    _goalSteps.value = newGoal;
    _updateProgressFromSteps();
  }

  void updateBalance(int newBalance) {
    _balance.value = newBalance;
  }

  void completeStreakDay(int dayIndex) {
    if (dayIndex >= 0 && dayIndex < _streakDays.length) {
      _streakDays[dayIndex] = _streakDays[dayIndex].copyWith(isCompleted: true);
      _streakDays.refresh();
    }
  }

  void resetStreak() {
    _streakDays.value = _streakDays
        .map((day) => day.copyWith(isCompleted: false))
        .toList();
  }

  String get progressPercentage => '${(progress * 100).toInt()}%';
  String get stepsText => '$currentSteps steps';
  String get goalText => 'Goal $goalSteps steps';
  String get balanceText => balance.toString();
}
