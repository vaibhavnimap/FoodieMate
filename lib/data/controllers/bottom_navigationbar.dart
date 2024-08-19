import 'package:get/get.dart';

class BottomNavigationbarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedIndex.value = 0;
    super.onInit();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
