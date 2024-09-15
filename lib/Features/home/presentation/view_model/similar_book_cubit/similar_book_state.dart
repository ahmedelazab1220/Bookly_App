part of 'similar_book_cubit.dart';

abstract class SimilarBookState {}

final class SimilarBookInitial extends SimilarBookState {}

class SimilarBooksFailure extends SimilarBookState {
  final String errMessage;

  SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilarBookState {
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilarBookState {}
