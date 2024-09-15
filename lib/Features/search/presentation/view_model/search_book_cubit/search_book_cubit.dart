import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.homeRepo) : super(SearchBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String category}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((errMessage) {
      emit(SearchBooksFailure(errMessage.toString()));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
