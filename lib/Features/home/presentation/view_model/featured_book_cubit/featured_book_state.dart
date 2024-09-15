part of 'featured_book_cubit.dart';

abstract class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBooksLoading extends FeaturedBookState {}

class FeaturedBooksFailure extends FeaturedBookState {
  final String errMessage;

  FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeaturedBookState {
  final List<BookModel> books;

  FeaturedBooksSuccess(this.books);
}
