
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    List<Movie> nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    nowPlayingMovies =  (nowPlayingMovies.isEmpty) ? [] : nowPlayingMovies.sublist(0, 8);
    List<Movie> slideShowMovies = ref.watch(nowPlayingMoviesProvider);
    List<Movie> popularMovies = ref.watch(popularMoviesProvider);
    List<Movie> upcomingMovies = ref.watch(upcomingMoviesProvider);
    List<Movie> topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                const SizedBox(height: 15),
                MoviesSlideShow(movieCollection: nowPlayingMovies),
                //** */
                MovieHorizontalListView(
                  movies: slideShowMovies,
                  title: 'En cines',
                  subTitle: 'Jueves 20',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                //** */
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares para ti',
                  subTitle: 'Agosto',
                  loadNextPage: () =>
                      ref.read(popularMoviesProvider.notifier).loadNextPage(),
                ),
                //** */
                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  subTitle: 'En Agosto',
                  loadNextPage: () =>
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                ),
                //** */
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: '2023',
                  loadNextPage: () =>
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                ),
                const SizedBox(height: 27),
              ],
            );
          },
          childCount: 1,
        ))
      ],
    );
  }
}