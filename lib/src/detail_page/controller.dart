import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/models/product.dart';
import '../../core/services/cart_service.dart';

class DetailPageController extends GetxController {
  final CartService _cartService = Get.find<CartService>();
  final RxInt quantity = 1.obs;
  final RxString selectedSize = ''.obs;
  final RxBool isInCart = false.obs;
  late final Product product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as Product;
    checkIfInCart();
  }

  void incrementQuantity() {
    if (quantity.value < product.stock) {
      quantity.value++;
    }
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void checkIfInCart() {
    isInCart.value = _cartService.items.any((item) => 
      item.product.id == product.id && item.size == selectedSize.value
    );
  }

  bool addToCart() {
    if (selectedSize.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a size',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    _cartService.addToCartWithSize(product, quantity.value, selectedSize.value);
    checkIfInCart();
    return true;
  }
}
