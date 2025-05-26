import 'package:flutter/material.dart';

import '../../../../home/data/model/book_model/book_model.dart';
import '../../../../home/presentaion/views/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const CustomSearchTextField(),
          const SizedBox(height: 16),
          Text(
            'Search Result',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(bookModel: BookModel()),
        );
      },
    );
  }
}
