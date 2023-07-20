import 'package:go_router/go_router.dart';
import '../../presentation/screens/screens.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/homeScreen',
  routes: [
    GoRoute(
      path: '/homeScreen',
      name: RoutesScreenApp.homeScreen.toString(),
      builder: (context, state) => const HomeScreens(),
    )
  ]
);

enum RoutesScreenApp{
  homeScreen
}