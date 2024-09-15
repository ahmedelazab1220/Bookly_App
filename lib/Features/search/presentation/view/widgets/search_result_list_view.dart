import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/news_book_list_view_item.dart';
import 'package:booklyapp/Features/search/presentation/view_model/search_book_cubit/search_book_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.only(top: 18),
            itemBuilder: (context, index) => SizedBox(
                child: NewestBooksListViewItem(
              bookModel: state.books[index],
            )),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: Text('No data here to show '));
        }
      },
    );
  }
}
