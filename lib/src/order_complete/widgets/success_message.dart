import 'package:flutter/material.dart';
import '../../../core/utils/app_string.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.orderSuccessful,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          AppStrings.thankYou,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}