import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/featuer/home/presentaion/manger/similar_books/similar_books_cubit.dart';
import 'package:bookly_app/featuer/home/presentaion/views/book_details_screen.dart';
import 'package:bookly_app/featuer/home/presentaion/views/home_screen.dart';
import 'package:bookly_app/featuer/splash/date/repo/search_repo_impl.dart';
import 'package:bookly_app/featuer/splash/presentaion/manger/search_books/search_books_cubit.dart';
import 'package:bookly_app/featuer/splash/presentaion/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../featuer/home/data/model/book_model/book_model.dart';
import '../featuer/home/data/repo/home_repo_impl.dart';
import '../featuer/search/presentaion/views/search_screen.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String bookDetails = '/BookDetails';
  static const String searchScreen = '/SearchScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: searchScreen,
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    SearchBooksCubit(getIt.get<SearchRepoImpl>()),
                child: const SearchScreen(),
              )),
      GoRoute(
          path: bookDetails,
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
                child: BookDetailsScreen(
                  bookModel: state.extra as BookModel,
                ),
              )),
    ],
  );
}
