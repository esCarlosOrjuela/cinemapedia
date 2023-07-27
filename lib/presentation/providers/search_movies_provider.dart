import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../delegates/search_movie_delegate.dart';

// Ultimo nombre buscado
final searchQueryProvider = StateProvider<String>((ref) => '');

// Ultmas peliculas retornadas
final searchMoviesProvider = StateNotifierProvider<SearchedMovieNotifier, List<Movie>>((ref) {
  final movirRepository= ref.read(movieRepositoryProvider);
  return SearchedMovieNotifier(ref: ref, searchMovies: movirRepository.searchMovies);
});

class SearchedMovieNotifier extends StateNotifier<List<Movie>> {
  SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMovieNotifier({required this.ref,required this.searchMovies}) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    // final movies = await MovieRepository().searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    final List<Movie> movies = await searchMovies(query);
    state = movies;
    return movies;
  }
}
