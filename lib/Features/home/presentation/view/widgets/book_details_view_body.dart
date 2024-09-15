import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/book_details.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_details_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/similar_list_view_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomDetailsAppBar(),
                BooksDetails(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const SimilarListViewSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
