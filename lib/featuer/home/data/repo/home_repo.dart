import 'package:bookly_app/featuer/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
