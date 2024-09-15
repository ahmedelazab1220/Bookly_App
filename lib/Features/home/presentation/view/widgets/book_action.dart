import 'package:booklyapp/Core/utils/launch_custom_url.dart';
import 'package:booklyapp/Core/widgets/custom_button.dart';
import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backGroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: getText(bookModel),
              onPressed: () {
                launchCustomUrl(context, bookModel.volumeInfo?.previewLink);
              },
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo?.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
