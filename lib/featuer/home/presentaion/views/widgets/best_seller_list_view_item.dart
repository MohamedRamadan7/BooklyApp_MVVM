import 'package:bookly_app/featuer/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetails);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                    'https://images.squarespace-cdn.com/content/v1/5fc7868e04dc9f2855c99940/32f738d4-e4b9-4c61-bfc0-e813699cdd3c/laura-barrett-illustrator-beloved-girls-book-cover.jpg?format=2500w'),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo?.title ??
                        'Harry Potter and the Goblet of Fire',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    bookModel.volumeInfo?.authors?[0] ?? 'J.K. Rowling',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '${bookModel.saleInfo?.listPrice?.amount ?? 19.9} \$',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo?.averageRating ?? 0,
                        count: bookModel.volumeInfo?.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
