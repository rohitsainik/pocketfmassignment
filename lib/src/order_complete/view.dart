import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/app_string.dart';
import 'controller.dart';
import 'widgets/continue_shopping_button.dart';
import 'widgets/order_summary_card.dart';
import 'widgets/success_icon.dart';
import 'widgets/success_message.dart';

class OrderCompletePage extends GetView<OrderCompleteController> {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppStrings.orderComplete),
        automaticallyImplyLeading: false,
      ),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return const Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SuccessIcon(),
            SizedBox(height: 24),
            SuccessMessage(),
            SizedBox(height: 32),
            OrderSummaryCard(),
            SizedBox(height: 48),
            ContinueShoppingButton(),
          ],
        ),
      ),
    );
  }
}
