import 'package:get/get.dart';
import 'package:pocketfmassignment/src/detail_page/controller.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPageController());
  }
}
