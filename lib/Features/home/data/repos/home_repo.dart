import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});

  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String category});
}
