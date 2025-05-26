import 'package:bookly_app/featuer/home/presentaion/views/book_details_screen.dart';
import 'package:bookly_app/featuer/home/presentaion/views/home_screen.dart';
import 'package:bookly_app/featuer/splash/presentaion/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

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
          builder: (context, state) => const SearchScreen()),
      GoRoute(
          path: bookDetails,
          builder: (context, state) => const BookDetailsScreen()),
    ],
  );
}
