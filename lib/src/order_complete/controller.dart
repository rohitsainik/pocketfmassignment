import 'package:get/get.dart';

class OrderCompleteController extends GetxController {
  final double total;
  final int itemCount;

  OrderCompleteController()
      : total = Get.arguments['total'] as double,
        itemCount = Get.arguments['itemCount'] as int;
}