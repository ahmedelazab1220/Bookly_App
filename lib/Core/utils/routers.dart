import 'package:booklyapp/Core/utils/injection_container.dart';
import 'package:booklyapp/Features/home/data/models/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_implementation.dart';
import 'package:booklyapp/Features/home/presentation/view/book_details_screen.dart';
import 'package:booklyapp/Features/home/presentation/view/home_screen.dart';
import 'package:booklyapp/Features/home/presentation/view_model/similar_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/Features/search/presentation/view/widgets/search_body.dart';
import 'package:booklyapp/Features/splash/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeSreen(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubit(
            getIt.get<HomeRepoImplementation>(),
          ),
          child: BookDetailsScreen(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchBody(),
      ),
    ],
  );
}
