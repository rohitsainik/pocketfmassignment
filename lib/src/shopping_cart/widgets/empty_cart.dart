import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_string.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.cartEmpty,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Get.back(),
              child: Text(AppStrings.continueShopping),
            ),
          ),
        ],
      ),
    );
  }
}