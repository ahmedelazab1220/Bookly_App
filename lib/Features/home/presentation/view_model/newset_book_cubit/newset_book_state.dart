part of 'newset_book_cubit.dart';

abstract class NewsetBookState {}

final class NewsetBookInitial extends NewsetBookState {}

class NewestBookLoading extends NewsetBookState {}

class NewestBookFailure extends NewsetBookState {
  final String errMessage;

  NewestBookFailure(this.errMessage);
}

class NewestBookSuccess extends NewsetBookState {
  final List<BookModel> books;

  NewestBookSuccess(this.books);
}
