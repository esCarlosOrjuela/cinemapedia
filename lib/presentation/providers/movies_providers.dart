import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesStatusChangeNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;
  /// Inicializamos el constructor retornando una lista de Movies vacia
  MoviesStatusChangeNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movieCollection = await fetchMoreMovies(page: currentPage);
    state = [...state,...movieCollection];
    await Future.delayed(const Duration(milliseconds: 400)); // Damos tiempo para renderiazar las imagenes en pantalla
    isLoading = false;
  }
}

/// Provider => Provider que notifica el cambio de estado de un objeto
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesStatusChangeNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesStatusChangeNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

/// Provider => Provider que notifica el cambio de estado de un objeto
final popularMoviesProvider = StateNotifierProvider<MoviesStatusChangeNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).gePopular;
  return MoviesStatusChangeNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

/// Provider => Provider que notifica el cambio de estado de un objeto
final upcomingMoviesProvider = StateNotifierProvider<MoviesStatusChangeNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesStatusChangeNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

/// Provider => Provider que notifica el cambio de estado de un objeto
final topRatedMoviesProvider = StateNotifierProvider<MoviesStatusChangeNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesStatusChangeNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

