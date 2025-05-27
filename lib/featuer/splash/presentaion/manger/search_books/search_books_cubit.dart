import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/model/book_model/book_model.dart';
import '../../../date/repo/search_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;

  static SearchBooksCubit get(context) => BlocProvider.of(context);
  List<BookModel> books = [];
  Future<void> fetchSearchBooks({required String search}) async {
    books.clear();
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(search: search);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (b) {
      books = b;
      emit(SearchBooksSuccess());
    });
  }
}
