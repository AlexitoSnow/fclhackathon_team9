import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/home/models/home_models.dart';
import 'package:fclhackathon_team9/core/services/wallet_api_service.dart';
import 'package:fclhackathon_team9/core/services/profile_api_service.dart';

class HomeController extends GetxController {
  // Services
  final WalletApiService _walletApiService = WalletApiService.instance;
  final ProfileApiService _profileApiService = ProfileApiService.instance;

  // Observable variables
  final RxDouble _progress = 0.0.obs;
  final RxInt _currentSteps = 0.obs;
  final RxInt _goalSteps = 5000.obs;
  final RxInt _balance = 42.obs;
  final RxList<StreakDay> _streakDays = <StreakDay>[].obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  double get progress => _progress.value;
  int get currentSteps => _currentSteps.value;
  int get goalSteps => _goalSteps.value;
  int get balance => _balance.value;
  List<StreakDay> get streakDays => _streakDays;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  @override
  void onInit() {
    super.onInit();
    _initializeStreakDays();
    fetchHomeData();
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

  /// Fetch home data from APIs
  Future<void> fetchHomeData() async {
    await Future.wait([_fetchWalletData(), _fetchProfileData()]);
  }

  /// Fetch wallet data for balance
  Future<void> _fetchWalletData() async {
    try {
      final response = await _walletApiService.fetchWalletEarnings();
      _balance.value = response.totalWalletValue.toInt();
    } catch (e) {
      // Keep default value for balance
    }
  }

  /// Fetch profile data for steps
  Future<void> _fetchProfileData() async {
    try {
      final response = await _profileApiService.fetchProfile();
      _currentSteps.value = response.steps.toInt();
      _updateProgressFromSteps();
    } catch (e) {
      // Keep default values
    }
  }

  /// Refresh home data
  Future<void> refreshHomeData() async {
    _isLoading.value = true;
    _errorMessage.value = '';

    try {
      await fetchHomeData();
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  void clearErrorMessage() {
    _errorMessage.value = '';
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
