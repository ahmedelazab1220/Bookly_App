import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit(this.homeRepo) : super(SimilarBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((errMessage) {
      emit(SimilarBooksFailure(errMessage.toString()));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
