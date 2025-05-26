import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';
import 'custom_appbar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedListView(),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Best Seller',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
