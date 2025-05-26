import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          rating.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 16),
        ),
        const SizedBox(width: 6),
        Text(
          '($count)',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
