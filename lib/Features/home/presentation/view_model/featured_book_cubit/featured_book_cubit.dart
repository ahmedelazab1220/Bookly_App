import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((errMessage) {
      emit(FeaturedBooksFailure(errMessage.toString()));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
