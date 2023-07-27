import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: RoutesScreenApp.homeScreen.toString(),
      builder: (context, state) {
        int page = int.parse(state.pathParameters['page'].toString()) ?? 0;
        if(page >= 3) page = 0;
        return HomeScreens(pageIndex: page,);
      },
      routes: [
        GoRoute(
          path: 'movieScreen/:movieId',
          name: RoutesScreenApp.movieScreen.toString(),
          builder: (context, state) {
            final movieId = state.pathParameters['movieId'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        )
      ]),
      GoRoute(
        path: '/',
        redirect: (_, __) => '/home/0',
      )
]);

enum RoutesScreenApp { 
  homeScreen, 
  favoritesScreen,
  movieScreen,
}
