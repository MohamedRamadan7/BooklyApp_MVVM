import 'package:bookly_app/core/function/custom_url_launcher.dart';
import 'package:bookly_app/featuer/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              titleColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              title: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                customUrlLauncher(context, bookModel.volumeInfo!.previewLink);
              },
              backgroundColor: Colors.deepOrangeAccent,
              titleColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              title: getText(bookModel),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo!.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
