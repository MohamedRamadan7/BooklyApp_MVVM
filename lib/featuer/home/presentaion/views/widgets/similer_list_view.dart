import 'package:bookly_app/featuer/home/presentaion/manger/similar_books/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilerListView extends StatelessWidget {
  const SimilerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(
                    imageUrl: state
                            .books[index].volumeInfo?.imageLinks?.thumbnail ??
                        'https://images.squarespace-cdn.com/content/v1/5fc7868e04dc9f2855c99940/32f738d4-e4b9-4c61-bfc0-e813699cdd3c/laura-barrett-illustrator-beloved-girls-book-cover.jpg?format=2500w'),
              ),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
