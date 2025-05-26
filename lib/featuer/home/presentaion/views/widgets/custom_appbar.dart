import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/assets_app.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 25),
      child: Row(
        children: [
          Image.asset(AssetsApp.logo, height: 24),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchScreen);
            },
            icon: const Icon(Icons.search, size: 28),
          )
        ],
      ),
    );
  }
}
