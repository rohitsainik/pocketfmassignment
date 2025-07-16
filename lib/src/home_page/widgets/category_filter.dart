import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

class CategoryFilter extends GetView<HomePageController> {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: GetBuilder<HomePageController>(
        id: 'filtered_products',
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              final isSelected = controller.selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FilterChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      controller.filterProducts(category);
                    }
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  checkmarkColor: Theme.of(context).colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}