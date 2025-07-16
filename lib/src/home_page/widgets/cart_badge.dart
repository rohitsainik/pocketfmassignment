import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

class CartBadge extends GetView<HomePageController> {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Get.toNamed('/cart'),
        ),
        Positioned(
          right: 0,
          child: Obx(() {
            final itemCount = controller.cartService.items.length;
            return itemCount > 0
                ? Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      itemCount.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox();
          }),
        ),
      ],
    );
  }
}