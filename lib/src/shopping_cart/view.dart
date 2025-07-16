import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketfmassignment/src/shopping_cart/controller.dart';
import '../../core/services/cart_service.dart';
import '../../core/utils/app_string.dart';
import 'widgets/cart_item_tile.dart';
import 'widgets/empty_cart.dart';
import 'widgets/order_summary.dart';

class ShoppingCartView extends GetView<ShoppingCartController> {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = Get.find<CartService>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _showClearCartDialog(context, cartService),
          ),
        ],
      ),
      body: Obx(() {
        if (cartService.items.isEmpty) {
          return const EmptyCart();
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: cartService.items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => CartItemTile(
            item: cartService.items[index],
            cartService: cartService,
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (cartService.items.isEmpty) return const SizedBox();
        return SafeArea(
          child: OrderSummary(cartService: cartService),
        );
      }),
    );
  }

  void _showClearCartDialog(BuildContext context, CartService cartService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppStrings.clearCart),
        content: Text(AppStrings.clearCartConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              cartService.clearCart();
              Navigator.pop(context);
              Get.snackbar(
                AppStrings.success,
                AppStrings.cartCleared,
                snackPosition: SnackPosition.TOP,
                backgroundColor: Theme.of(context).colorScheme.primary,
                colorText: Colors.white,
                margin: const EdgeInsets.all(16),
                borderRadius: 12,
              );
            },
            child: Text(
              AppStrings.clear,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
