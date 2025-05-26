import 'package:bookly_app/core/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/featuer/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/featuer/home/presentaion/manger/feature_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/featuer/home/presentaion/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constant.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..featchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..featchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
