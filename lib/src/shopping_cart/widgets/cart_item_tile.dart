import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/quantity_selector.dart';
import '../../../core/models/cart_item.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/utils/app_string.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final CartService cartService;

  const CartItemTile({
    super.key,
    required this.item,
    required this.cartService,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        cartService.removeFromCart(item.product.id);
        Get.snackbar(
          AppStrings.success,
          AppStrings.itemRemoved,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Theme.of(context).colorScheme.primary,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.product.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Size: ${item.size}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${AppStrings.currencySymbol}${item.product.price}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            QuantitySelector(
              quantity: item.quantity,
              onIncrement: () => cartService.updateQuantity(
                item.product.id,
                item.quantity + 1,
                item.size,
              ),
              onDecrement: () => cartService.updateQuantity(
                item.product.id,
                item.quantity - 1,
                item.size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}