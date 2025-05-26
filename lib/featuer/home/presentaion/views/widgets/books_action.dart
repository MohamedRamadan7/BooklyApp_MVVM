import 'package:flutter/material.dart';

import 'custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
  });

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
              backgroundColor: Colors.deepOrangeAccent,
              titleColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              title: 'Free Preview',
            ),
          ),
        ],
      ),
    );
  }
}
