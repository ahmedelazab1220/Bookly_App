import 'package:booklyapp/Features/home/presentation/view/widgets/custom_details_app_bar.dart';
import 'package:booklyapp/Features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:booklyapp/Features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDetailsAppBar(),
              CustomSearchTextField(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Search Result',
                style: Styles.textStyle20,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SearchResultListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
