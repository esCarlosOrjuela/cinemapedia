import 'package:cinemapedia/presentation/bloc/initial_loading/initial_loading_controller.dart';
import 'package:cinemapedia/presentation/bloc/initial_loading/initial_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreensBloc extends StatelessWidget {
  const HomeScreensBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: InitialLoadingController.new,
      child: BlocBuilder<InitialLoadingController, LoadingState>(
          builder: (_, state) => switch (state) {
                InitialLoadingState() => const FullScreenLoader(),
                SteadyLoadingState() => CustomScrollView(
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
                              MoviesSlideShow(
                                  movieCollection: state.nowPlayingMovies),
                              //** */
                              MovieHorizontalListView(
                                movies: state.slideShowMovies,
                                title: 'En cines',
                                subTitle: 'Jueves 20',
                                loadNextPage: () => ref
                                    .read(nowPlayingMoviesProvider.notifier)
                                    .loadNextPage(),
                              ),
                              //** */
                              MovieHorizontalListView(
                                movies: state.popularMovies,
                                title: 'Populares para ti',
                                subTitle: 'Agosto',
                                loadNextPage: () => ref
                                    .read(popularMoviesProvider.notifier)
                                    .loadNextPage(),
                              ),
                              //** */
                              MovieHorizontalListView(
                                movies: state.upcomingMovies,
                                title: 'Proximamente',
                                subTitle: 'En Agosto',
                                loadNextPage: () => ref
                                    .read(upcomingMoviesProvider.notifier)
                                    .loadNextPage(),
                              ),
                              //** */
                              MovieHorizontalListView(
                                movies: state.topRatedMovies,
                                title: 'Mejor calificadas',
                                subTitle: '2023',
                                loadNextPage: () => ref
                                    .read(topRatedMoviesProvider.notifier)
                                    .loadNextPage(),
                              ),
                              const SizedBox(height: 27),
                            ],
                          );
                        },
                        childCount: 1,
                      ))
                    ],
                  ),
              }),
    );
  }
}
