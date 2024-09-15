import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_book_state.dart';

class NewsetBookCubit extends Cubit<NewsetBookState> {
  NewsetBookCubit(this.homeRepo) : super(NewsetBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());

    var result = await homeRepo.fetchNewsetBooks();
    result.fold((errMessage) {
      emit(NewestBookFailure(errMessage.toString()));
    }, (books) {
      emit(NewestBookSuccess(books));
    });
  }
}
