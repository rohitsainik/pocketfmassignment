import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketfmassignment/core/utils/app_string.dart';
import 'package:pocketfmassignment/src/detail_page/controller.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/product_image.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/product_price.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/product_rating.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/quantity_selector.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/size_selector.dart';
import 'package:pocketfmassignment/src/detail_page/widgets/cart_icon_with_badge.dart';

class DetailPage extends GetView<DetailPageController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildBody(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  SafeArea buildBottomNavigationBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() => ElevatedButton(
          onPressed: () {
            if (controller.addToCart()) {
              Get.snackbar(
                AppStrings.success,
                '${controller.product.title} ${AppStrings.addedToCart}',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Theme.of(context).colorScheme.primary,
                colorText: Colors.white,
              );
            }
          },
          child: Text(controller.isInCart.value
              ? AppStrings.addAgain
              : AppStrings.addToCart),
        )),
      ),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(
            imageUrl: controller.product.image,
            isNew: controller.product.isNew,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.product.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ProductPrice(
                  price: controller.product.price,
                  oldPrice: controller.product.oldPrice,
                ),
                const SizedBox(height: 16),
                ProductRating(rating: controller.product.rating.toDouble()),
                const SizedBox(height: 24),
                Text(
                  AppStrings.size,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Obx(() => SizeSelector(
                  sizes: controller.product.size,
                  selectedSize: controller.selectedSize.value,
                  onSizeSelected: controller.selectSize,
                )),
                const SizedBox(height: 24),
                Text(
                  AppStrings.quantity,
                  style: Theme.of(context).textTheme.titleMedium,
                ),



                const SizedBox(height: 12),
                Obx(() => QuantitySelector(
                  quantity: controller.quantity.value,
                  onIncrement: controller.incrementQuantity,
                  onDecrement: controller.decrementQuantity,
                )),

                const SizedBox(height: 24),
                Text(
                  AppStrings.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  controller.product.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        controller.product.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        const CartIconWithBadge(),
      ],
    );
  }
}
