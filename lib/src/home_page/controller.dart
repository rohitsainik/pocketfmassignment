import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketfmassignment/core/utils/app_string.dart';

import '../../core/models/product.dart';
import '../../core/services/cart_service.dart';
import '../../core/services/product_service.dart';

class HomePageController extends GetxController {
  final ProductService productService = ProductService();
  final CartService cartService = Get.put(CartService());
  final RxList<Product> _products = <Product>[].obs;
  final RxString _selectedCategory = ''.obs;
  final RxList<String> categories = [
    AppStrings.categoryAll,
    AppStrings.categoryMen,
    AppStrings.categoryWomen,
    AppStrings.categoryKids,
  ].obs;
  final RxBool isLoading = true.obs;
  final RxString error = RxString('');

  List<Product> get products => _products;
  String get selectedCategory => _selectedCategory.value;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      isLoading.value = true;
      error.value = '';

      final loadedProducts = await productService.getProducts();
      _products.assignAll(loadedProducts);
    } catch (e) {
      error.value = e.toString();
      Get.snackbar(
        AppStrings.error,
        '${AppStrings.errorFailedToLoad}: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void filterProducts(String category) {
    _selectedCategory.value = category;
    // Force refresh of filteredProducts
    update(['filtered_products']);
  }

  List<Product> get filteredProducts {
    if (_selectedCategory.isEmpty ||
        _selectedCategory.value == AppStrings.categoryAll) {
      return _products;
    }
    return productService.filterProducts(_products, _selectedCategory.value);
  }
}
