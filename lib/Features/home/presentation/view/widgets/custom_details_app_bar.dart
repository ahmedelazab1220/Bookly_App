import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
