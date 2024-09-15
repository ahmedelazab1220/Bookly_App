import 'package:booklyapp/Features/home/presentation/view/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
