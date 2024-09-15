import 'package:booklyapp/Core/utils/routers.dart';
import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:booklyapp/Features/home/presentation/view_model/featured_book_cubit/featured_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .28,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: state.books[index]);
                },
                child: CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                          '',
                ),
              );
            },
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
