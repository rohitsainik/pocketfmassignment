import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../utils/app_string.dart';

class ProductService extends GetxService {
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  Future<List<Product>> getProducts() async {
    try {
      isLoading.value = true;
      error.value = '';

      final String response = await rootBundle.loadString('assets/data.json');
      final data = await json.decode(response);

      if (data == null) {
        throw Exception(AppStrings.errorNullData);
      }

      if (!data.containsKey('data')) {
        throw Exception(AppStrings.errorInvalidJson);
      }

      final List<dynamic> productData = data['data'];
      final List<Product> loadedProducts = productData.map((json) {
        return Product.fromJson(json);
      }).toList();
      products.assignAll(loadedProducts);
      return loadedProducts;
    } catch (e) {
      error.value = '${AppStrings.errorFailedToLoad}: $e';
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  List<Product> filterProducts(List<Product> productList, String? category) {
    if (category == null ||
        category.isEmpty ||
        category.toLowerCase() == 'all') {
      return productList;
    }
    return productList
        .where(
          (product) => product.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }

  List<Product> searchProducts(List<Product> productList, String query) {
    if (query.isEmpty) return productList;
    return productList
        .where(
          (product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
