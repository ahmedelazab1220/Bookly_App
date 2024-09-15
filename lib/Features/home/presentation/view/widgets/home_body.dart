import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/books_list_view.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/view/widgets/news_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              BooksListView(),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
