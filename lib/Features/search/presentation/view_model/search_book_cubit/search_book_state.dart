part of 'search_book_cubit.dart';

abstract class SearchBookState {}

final class SearchBookInitial extends SearchBookState {}

final class SearchBooksFailure extends SearchBookState {
  final String errMessage;

  SearchBooksFailure(this.errMessage);
}

final class SearchBooksSuccess extends SearchBookState {
  final List<BookModel> books;

  SearchBooksSuccess(this.books);
}

final class SearchBooksLoading extends SearchBookState {}
