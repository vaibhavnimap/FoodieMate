import 'package:get/get.dart';

class ProductController extends GetxController {
  RxString productSize = ''.obs;
  RxString petDrink = ''.obs;
  RxInt productQuantity = 1.obs;
  RxDouble productPrice = 0.0.obs;
  RxDouble initialProductPrice = 0.0.obs;

  void changeSize(String size) {
    productSize.value = size;
  }

  void increaseQuantity() {
    productQuantity.value++;
    productPrice.value = productPrice.value + initialProductPrice.value;
  }

  void decreaseQuantity() {
    if (productQuantity.value == 1) {
      return;
    }
    productQuantity.value--;
    productPrice.value = productPrice.value - initialProductPrice.value;
  }

  void changeDrink(String drink) {
    petDrink.value = drink;
  }
}
