import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/app_string.dart';
import 'controller.dart';
import 'widgets/cart_badge.dart';
import 'widgets/category_filter.dart';
import 'widgets/error_view.dart';
import 'widgets/product_grid.dart';

class MyHomePage extends GetView<HomePageController> {
  const MyHomePage({super.key, required this.title});

  final String title;

  Widget _buildBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.error.value.isNotEmpty) {
        return const ErrorView();
      }

      if (controller.products.isEmpty) {
        return Center(child: Text(AppStrings.noProductsAvailable));
      }

      return Column(
        children: const [
          CategoryFilter(),
          ProductGrid(),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          CartBadge(),
        ],
      ),
      body: _buildBody(),
    );
  }
}
