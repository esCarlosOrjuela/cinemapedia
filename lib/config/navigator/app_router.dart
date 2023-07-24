import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: RoutesScreenApp.homeScreen.toString(),
      builder: (context, state) => const HomeScreens(),
      routes: [
        GoRoute(
          path: 'movieScreen/:movieId',
          name: RoutesScreenApp.movieScreen.toString(),
          builder: (context, state) {
            final movieId = state.pathParameters['movieId'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        )
      ])
]);

enum RoutesScreenApp { homeScreen, movieScreen }
