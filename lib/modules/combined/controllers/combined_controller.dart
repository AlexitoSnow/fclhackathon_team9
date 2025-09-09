import 'package:get/get.dart';

class CombinedController extends GetxController {
  final RxInt currentIndex = 1.obs;
  void setIndex(int index) => currentIndex.value = index;
}
