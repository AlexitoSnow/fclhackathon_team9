import 'package:get/get.dart';

class WalletController extends GetxController {
  final RxDouble walletBalance = 42.0.obs;
  final RxDouble monthlyEarnings = 42.0.obs;
  final RxDouble monthlyTarget = 42.0.obs;

  double get progress {
    final target = monthlyTarget.value == 0 ? 1.0 : monthlyTarget.value;
    final ratio = monthlyEarnings.value / target;
    return ratio.clamp(0.0, 1.0);
  }

  void openTransactions() {}
  void openNotifications() {}
}
