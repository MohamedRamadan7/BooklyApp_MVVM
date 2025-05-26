import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilerListView extends StatelessWidget {
  const SimilerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: CustomBookImage(
              imageUrl:
                  'https://images.squarespace-cdn.com/content/v1/5fc7868e04dc9f2855c99940/32f738d4-e4b9-4c61-bfc0-e813699cdd3c/laura-barrett-illustrator-beloved-girls-book-cover.jpg?format=2500w'),
        ),
      ),
    );
  }
}
