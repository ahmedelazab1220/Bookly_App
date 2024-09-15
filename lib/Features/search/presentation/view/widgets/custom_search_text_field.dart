import 'package:booklyapp/Features/search/presentation/view_model/search_book_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
        builder: (context, state) {
      SearchBookCubit cubit = BlocProvider.of(context);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextField(
          autofocus: true,
          enableSuggestions: true,
          cursorHeight: 25,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search ...',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                ),
              ),
            ),
          ),
          onChanged: (value) {
            cubit.fetchSearchBooks(category: value);
          },
        ),
      );
    });
  }

  OutlineInputBorder buildOutlineInputBorder() => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      );
}
