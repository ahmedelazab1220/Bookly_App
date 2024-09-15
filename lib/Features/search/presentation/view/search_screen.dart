import 'package:booklyapp/Features/search/presentation/view/widgets/search_body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchBody(),
      ),
    );
  }
}
