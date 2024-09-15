import 'package:booklyapp/Core/widgets/custom_error_widget.dart';
import 'package:booklyapp/Core/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/news_book_list_view_item.dart';
import 'package:booklyapp/Features/home/presentation/view_model/newset_book_cubit/newset_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBookCubit, NewsetBookState>(
      builder: (context, state) {
        if (state is NewestBookSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) => NewestBooksListViewItem(
              bookModel: state.books[index],
            ),
          );
        } else if (state is NewestBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
