import 'package:flutter/material.dart';

import 'book_details_section.dart';
import 'book_similer_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                CustomBookDetailsAppBar(),
                SizedBox(height: 16),
                BookDetailsSection(),
                Expanded(child: SizedBox(height: 42)),
                BookSimilerSection(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
