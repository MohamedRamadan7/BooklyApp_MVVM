import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: BestSellerListViewItem(bookModel: state.books[index]),
            ),
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
