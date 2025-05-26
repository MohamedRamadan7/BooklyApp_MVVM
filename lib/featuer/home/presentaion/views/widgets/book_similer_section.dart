import 'package:flutter/material.dart';

import 'similer_list_view.dart';

class BookSimilerSection extends StatelessWidget {
  const BookSimilerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You can also like',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 16),
        const SimilerListView(),
      ],
    );
  }
}
