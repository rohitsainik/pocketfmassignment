import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/utils/app_string.dart';

class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          ignoreGestures: true,
          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(width: 8),
        Text(
          AppStrings.ratingFormat.replaceAll('{rating}', rating.toString()),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}