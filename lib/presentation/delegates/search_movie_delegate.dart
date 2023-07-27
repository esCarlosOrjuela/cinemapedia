import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  Timer? _timer;
  List<Movie> initialMovies;
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> searchController = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

  @override
  String get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              spins: 10,
              infinite: true,
              child: IconButton(
                  onPressed: () => query = '',
                  icon: const Icon(Icons.refresh_rounded)),
            );
          }

          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () => query = '', 
              icon: const Icon(Icons.clear)
            ),
          );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          _cleanStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Cada vez que presione una tecla:

    _onQueryChanges(query);
    return StreamBuilder(
      stream: searchController.stream,
      builder: (context, response) {
        final movies = response.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
              movie: movies[index],
              onMovieSelected: (context, Movie movieSelected) {
                _cleanStreams();
                close(context, movieSelected);
              }),
        );
      },
    );
  }

  void _onQueryChanges(String query) {
    isLoadingStream.add(true);
    //print('Query string Cambio');
    // Cada vez que la persona teclea limpa el time
    if (_timer?.isActive ?? false) _timer?.cancel();
    // cuando deja de escribir por 500 milliseconds, hace la busqueda
    _timer = Timer(const Duration(milliseconds: 500), () async {
      // buscamos las peliculas
      //print('Buscando pelicula');
      if (query.isEmpty) {
        searchController.add([]);
        return;
      }

      final searchResult = await searchMovies(query);
      searchController.add(searchResult);
      isLoadingStream.add(false);
    });
  }

  void _cleanStreams() {
    searchController.close();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final sizeDevice = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: sizeDevice.width * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    loadingBuilder: (context, child, loadingProgress) =>
                        FadeIn(child: child),
                  )),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: sizeDevice.width * 0.7,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(movie.title, style: textTheme.titleMedium),
                    // Description
                    (movie.overview.length > 127)
                        ? Text('${movie.overview.substring(0, 127)}...')
                        : Text(movie.overview),
                    // Rating
                    Row(children: [
                      Icon(Icons.star_half_rounded,
                          color: Colors.yellow.shade800),
                      const SizedBox(width: 8),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textTheme.bodyMedium
                            ?.copyWith(color: Colors.yellow.shade900),
                      )
                    ])
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
