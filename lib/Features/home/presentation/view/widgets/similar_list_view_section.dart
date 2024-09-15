import 'package:booklyapp/Features/home/presentation/view/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class SimilarListViewSection extends StatelessWidget {
  const SimilarListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like : ',
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SimilarBooksListView(),
      ],
    );
  }
}
