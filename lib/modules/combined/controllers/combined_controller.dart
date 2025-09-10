import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/combined/controllers/navigation_controller.dart';

class CombinedController extends GetxController {
  final RxInt currentIndex = 1.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize navigation controller
    Get.put(NavigationController());
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  void setIndex(int index) {
    if (index >= 0 && index <= 3) {
      currentIndex.value = index;
      // Sync with navigation controller
      final navController = Get.find<NavigationController>();
      navController.changePage(index);
    }
  }

  // Getters for individual page states
  bool get isHomeSelected => currentIndex.value == 0;
  bool get isWalletSelected => currentIndex.value == 1;
  bool get isBadgesSelected => currentIndex.value == 2;
  bool get isProfileSelected => currentIndex.value == 3;
}
