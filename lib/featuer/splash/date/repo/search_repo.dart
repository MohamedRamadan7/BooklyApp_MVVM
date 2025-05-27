import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/model/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String search});
}
