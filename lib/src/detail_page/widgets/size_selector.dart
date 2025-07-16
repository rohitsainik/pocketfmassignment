import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final Function(String) onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: sizes.map((size) {
        final isSelected = selectedSize == size;
        return GestureDetector(
          onTap: () => onSizeSelected(size),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
              ),
            ),
            child: Text(
              size,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}