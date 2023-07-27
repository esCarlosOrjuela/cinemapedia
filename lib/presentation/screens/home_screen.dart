import 'package:cinemapedia/presentation/views/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import '../views/home_view.dart';

class HomeScreens extends StatelessWidget {
  final int pageIndex;

  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];

  const HomeScreens({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottonNavigationbar(currentIndex: pageIndex),
    );
  }
}
