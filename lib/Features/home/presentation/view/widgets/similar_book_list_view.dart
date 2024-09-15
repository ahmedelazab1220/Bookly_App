import 'package:booklyapp/Core/utils/routers.dart';
import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .20,
          child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                            '',
                  ),
                );
              }),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
