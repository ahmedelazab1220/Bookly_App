import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/book_action.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/book_rating.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class BooksDetails extends StatelessWidget {
  const BooksDetails({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18, vertical: 10),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          bookModel.volumeInfo?.title ?? '',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo?.authors![0] ?? '',
            style: Styles.textStyle20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BookRating(
          rating: bookModel.volumeInfo?.averageRating ?? 0,
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
