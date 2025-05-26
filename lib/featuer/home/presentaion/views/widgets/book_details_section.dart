import 'package:flutter/material.dart';

import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .2),
          child: const CustomBookImage(
              imageUrl:
                  'https://images.squarespace-cdn.com/content/v1/5fc7868e04dc9f2855c99940/32f738d4-e4b9-4c61-bfc0-e813699cdd3c/laura-barrett-illustrator-beloved-girls-book-cover.jpg?format=2500w'),
        ),
        const SizedBox(height: 42),
        Text(
          'The Jangle Book',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ),
        const SizedBox(height: 8),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 4.5,
          count: 123,
        ),
        const SizedBox(height: 32),
        const BooksAction(),
      ],
    );
  }
}
