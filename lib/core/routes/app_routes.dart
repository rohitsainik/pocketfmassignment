import 'package:get/get.dart';
import 'package:pocketfmassignment/src/detail_page/binding.dart';
import 'package:pocketfmassignment/src/detail_page/view.dart';
import 'package:pocketfmassignment/src/home_page/binding.dart';
import 'package:pocketfmassignment/src/order_complete/binding.dart';
import 'package:pocketfmassignment/src/order_complete/view.dart';
import 'package:pocketfmassignment/src/shopping_cart/binding.dart';
import 'package:pocketfmassignment/src/shopping_cart/view.dart';
import '../../src/home_page/view.dart';

class AppRoutes {
  static const String home = '/';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String orderComplete = '/order-complete';

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const MyHomePage(title: 'Online Store'),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: productDetail,
      binding: DetailPageBinding(),
      page: () => DetailPage(),
    ),
    GetPage(
      name: cart,
      page: () => ShoppingCartView(),
      binding: ShoppingCartBinding(),
    ),
    GetPage(
      name: orderComplete,
      page: () => const OrderCompletePage(),
      binding: OrderCompleteBinding(),
    ),
  ];
}
