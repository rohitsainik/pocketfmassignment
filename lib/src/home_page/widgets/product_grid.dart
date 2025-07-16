import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import 'product_card.dart';

class ProductGrid extends GetView<HomePageController> {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: controller.loadProducts,
        child: Obx(() {
          final filteredProducts = controller.filteredProducts;
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: filteredProducts[index]);
            },
          );
        }),
      ),
    );
  }
}