import 'package:flutter/material.dart';

import '../../../data/model/book_model/book_model.dart';
import 'book_details_section.dart';
import 'book_similer_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 16),
                BookDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 42)),
                BookSimilerSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
