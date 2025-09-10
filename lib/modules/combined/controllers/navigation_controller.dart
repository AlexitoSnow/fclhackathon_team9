import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/combined/controllers/combined_controller.dart';

class NavigationController extends GetxController {
  // Observable variable for current page index
  final RxInt _currentIndex = 0.obs;

  // Getter
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    super.onInit();
    // Initialize with wallet page (index 1) as default
    _currentIndex.value = 1;
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  // Methods
  void changePage(int index) {
    if (index >= 0 && index <= 3) {
      _currentIndex.value = index;
      // Sync with combined controller if it exists
      try {
        final combinedController = Get.find<CombinedController>();
        combinedController.setIndex(index);
      } catch (e) {
        // CombinedController not found, that's okay
      }
    }
  }

  void goToHome() => changePage(0);
  void goToWallet() => changePage(1);
  void goToBadges() => changePage(2);
  void goToProfile() => changePage(3);

  // Getters for individual page states
  bool get isHomeSelected => currentIndex == 0;
  bool get isWalletSelected => currentIndex == 1;
  bool get isBadgesSelected => currentIndex == 2;
  bool get isProfileSelected => currentIndex == 3;
}
