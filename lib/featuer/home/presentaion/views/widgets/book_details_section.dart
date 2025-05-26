import 'package:flutter/material.dart';

import '../../../data/model/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .2),
          child: CustomBookImage(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                  'https://images.squarespace-cdn.com/content/v1/5fc7868e04dc9f2855c99940/32f738d4-e4b9-4c61-bfc0-e813699cdd3c/laura-barrett-illustrator-beloved-girls-book-cover.jpg?format=2500w'),
        ),
        const SizedBox(height: 42),
        Text(
          bookModel.volumeInfo?.title ?? 'The Jangle Book',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo?.authors?[0] ?? 'Rudyard Kipling',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ),
        const SizedBox(height: 8),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
        ),
        const SizedBox(height: 32),
        BooksAction(bookModel: bookModel),
      ],
    );
  }
}
