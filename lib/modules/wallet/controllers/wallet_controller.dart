import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/wallet/models/wallet_models.dart';
import 'package:fclhackathon_team9/core/services/wallet_api_service.dart';

class WalletController extends GetxController {
  // Services
  final WalletApiService _apiService = WalletApiService.instance;

  // Observable variables
  final RxDouble _walletBalance = 42.0.obs;
  final RxDouble _monthlyEarnings = 42.0.obs;
  final RxDouble _monthlyTarget = 42.0.obs;
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  double get walletBalance => _walletBalance.value;
  double get monthlyEarnings => _monthlyEarnings.value;
  double get monthlyTarget => _monthlyTarget.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  double get progress {
    final target = _monthlyTarget.value == 0 ? 1.0 : _monthlyTarget.value;
    final ratio = _monthlyEarnings.value / target;
    return ratio.clamp(0.0, 1.0);
  }

  @override
  void onInit() {
    super.onInit();
    _initializeWalletData();
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void _initializeWalletData() {
    // Load wallet data from API on initialization
    fetchWalletEarnings();
  }

  /// Fetch wallet earnings from the API
  Future<void> fetchWalletEarnings() async {
    try {
      setLoading(true);
      _errorMessage.value = '';

      final response = await _apiService.fetchWalletEarnings();

      // Update the wallet data with API response
      _walletBalance.value = response.totalWalletValue;
      _monthlyEarnings.value = response.monthlyEarning;
      _monthlyTarget.value = response.monthlyTarget;
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      setLoading(false);
    }
  }

  /// Refresh wallet data
  Future<void> refreshWalletData() async {
    await fetchWalletEarnings();
  }

  void updateWalletBalance(double newBalance) {
    _walletBalance.value = newBalance;
  }

  void updateMonthlyEarnings(double earnings) {
    _monthlyEarnings.value = earnings;
  }

  void updateMonthlyTarget(double target) {
    _monthlyTarget.value = target;
  }

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  void clearErrorMessage() {
    _errorMessage.value = '';
  }

  void openTransactions() {
    // Navigate to transactions view
    // This is handled in the view
  }

  void openNotifications() {
    // Navigate to notifications view
    // This is handled in the view
  }

  String get balanceText => walletBalance.toStringAsFixed(0);
  String get earningsText =>
      '${monthlyEarnings.toStringAsFixed(0)} / ${monthlyTarget.toStringAsFixed(0)}';
  String get progressPercentage => '${(progress * 100).toInt()}%';

  WalletData get walletData => WalletData(
    balance: walletBalance,
    monthlyEarnings: monthlyEarnings,
    monthlyTarget: monthlyTarget,
    progress: progress,
  );
}
