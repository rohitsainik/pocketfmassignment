import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_string.dart';
import '../controller.dart';

class OrderSummaryCard extends GetView<OrderCompleteController> {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            AppStrings.orderSummary,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          _buildSummaryRow(context, AppStrings.totalItems, controller.itemCount.toString()),
          const SizedBox(height: 8),
          _buildSummaryRow(
            context,
            AppStrings.cartTotal,
            '${AppStrings.currencySymbol}${controller.total.toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}