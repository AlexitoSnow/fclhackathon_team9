import 'package:get/get.dart';
import 'package:fclhackathon_team9/modules/combined/controllers/combined_controller.dart';
import 'package:fclhackathon_team9/modules/wallet/controllers/wallet_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CombinedController>(CombinedController(), permanent: true);
    Get.put<WalletController>(WalletController(), permanent: true);
  }
}
