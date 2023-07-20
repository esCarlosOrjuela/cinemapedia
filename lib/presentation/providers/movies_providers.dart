import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MovieCallback = Future<List<Movie>> Function({int page});

/// Provider => Provider que notifica el cambio de estado de un objeto
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesStatusChangeNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesStatusChangeNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

class MoviesStatusChangeNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  MovieCallback fetchMoreMovies;
  /// Inicializamos el constructor retornando una lista de Movies vacia
  MoviesStatusChangeNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async{
    currentPage++;

  final List<Movie> movieCollection = await fetchMoreMovies(page: currentPage);

    state = [...state,...movieCollection];
  }
}
