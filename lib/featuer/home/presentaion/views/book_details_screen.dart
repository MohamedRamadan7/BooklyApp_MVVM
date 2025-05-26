import 'package:bookly_app/featuer/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/similar_books/similar_books_cubit.dart';
import 'widgets/book_details_view_body.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).featchSimilarBooks(
        category: widget.bookModel.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(),
      ),
    );
  }
}
