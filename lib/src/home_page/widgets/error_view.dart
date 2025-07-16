import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_string.dart';
import '../controller.dart';

class ErrorView extends GetView<HomePageController> {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            AppStrings.errorLoadingProducts,
            style: Get.theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            controller.error.value,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.loadProducts,
            child: Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}