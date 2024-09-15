import 'package:booklyapp/Core/utils/injection_container.dart';
import 'package:booklyapp/Core/utils/routers.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_implementation.dart';
import 'package:booklyapp/Features/home/presentation/view_model/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/Features/home/presentation/view_model/newset_book_cubit/newset_book_cubit.dart';
import 'package:booklyapp/Features/search/presentation/view_model/search_book_cubit/search_book_cubit.dart';
import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupServiceLocator();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBookCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              SearchBookCubit(getIt.get<HomeRepoImplementation>()),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          ),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
