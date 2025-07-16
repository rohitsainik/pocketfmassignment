import 'package:flutter/material.dart';
import '../../../core/utils/app_string.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final String oldPrice;

  const ProductPrice({
    super.key,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${AppStrings.currencySymbol}$price',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        if (oldPrice != price.toString())
          Text(
            '${AppStrings.currencySymbol}$oldPrice',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}