import 'package:get/get.dart';

import 'controller.dart';

class ShoppingCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShoppingCartController>(() => ShoppingCartController());
  }
}
