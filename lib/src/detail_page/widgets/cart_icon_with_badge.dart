import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/cart_service.dart';

class CartIconWithBadge extends StatelessWidget {
  const CartIconWithBadge({super.key});

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
          top: 0,
          child: GetX<CartService>(
            builder: (controller) => controller.items.isEmpty
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      controller.items.length.toString(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}