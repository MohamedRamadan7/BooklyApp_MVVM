import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentaion/views/widgets/best_seller_list_view_item.dart';
import '../../../../splash/presentaion/manger/search_books/search_books_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        SearchBooksCubit cubit = SearchBooksCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              CustomSearchTextField(
                controller: searchController,
                onPressed: () {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 200), () {
                    cubit.fetchSearchBooks(search: searchController.text);
                  });
                },
              ),
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
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        SearchBooksCubit cubit = SearchBooksCubit.get(context);
        if (state is SearchBooksFailure) {
          return Center(child: Text(state.errMessage));
        } else if (state is SearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return cubit.books.isEmpty
              ? const Center(child: Text('Empty'))
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.books.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child:
                        BestSellerListViewItem(bookModel: cubit.books[index]),
                  ),
                );
        }
      },
    );
  }
}
