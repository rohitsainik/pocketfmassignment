import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketfmassignment/core/routes/app_routes.dart';
import 'package:pocketfmassignment/src/order_complete/view.dart';
import '../../../core/services/cart_service.dart';
import '../../../core/utils/app_string.dart';

class OrderSummary extends StatelessWidget {
  final CartService cartService;

  const OrderSummary({super.key, required this.cartService});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.orderSummary,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildSummaryRow(
            context,
            AppStrings.subtotal,
            cartService.subtotal,
          ),
          const SizedBox(height: 8),
          _buildSummaryRow(
            context,
            AppStrings.shipping,
            cartService.shipping,
          ),
          const SizedBox(height: 8),
          _buildSummaryRow(
            context,
            AppStrings.tax,
            cartService.tax,
          ),
          const Divider(height: 24),
          _buildTotalRow(context),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.orderComplete,
                arguments: {
                  'total': cartService.total,
                  'itemCount': cartService.items.length,
                },
              );
              cartService.clearCart(); // Clear the cart after successful checkout
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: Text(AppStrings.checkout),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String title, double amount, {bool isDiscount = false}) {
    final color = isDiscount ? Theme.of(context).colorScheme.error : null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
        ),
        Text(
          '${AppStrings.currencySymbol}${amount.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color),
        ),
      ],
    );
  }

  Widget _buildTotalRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.cartTotal,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '${AppStrings.currencySymbol}${cartService.total.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}