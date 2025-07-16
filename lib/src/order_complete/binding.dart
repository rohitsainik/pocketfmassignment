import 'package:get/get.dart';
import 'controller.dart';

class OrderCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderCompleteController());
  }
}