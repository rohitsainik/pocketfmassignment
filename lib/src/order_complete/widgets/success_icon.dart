import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle_outline,
      size: 100,
      color: Colors.green,
    );
  }
}