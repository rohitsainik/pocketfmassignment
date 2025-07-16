import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_string.dart';

class ContinueShoppingButton extends StatelessWidget {
  const ContinueShoppingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.offAllNamed(AppRoutes.home),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 48),
      ),
      child: Text(AppStrings.continueShopping),
    );
  }
}