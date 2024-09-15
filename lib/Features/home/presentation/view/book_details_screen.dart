import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SimilarBookCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo?.categories?[0] ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
