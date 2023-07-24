import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LoadingState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> slideShowMovies;
  final List<Movie> popularMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> topRatedMovies;

  LoadingState({
    this.nowPlayingMovies = const [],
    this.slideShowMovies = const [],
    this.popularMovies = const [],
    this.upcomingMovies = const [],
    this.topRatedMovies = const [],
  });
}

class InitialLoadingState extends LoadingState {}

class SteadyLoadingState extends LoadingState {
  SteadyLoadingState({
    required super.nowPlayingMovies,
    required super.slideShowMovies,
    required super.popularMovies,
    required super.upcomingMovies,
    required super.topRatedMovies,
  });
}
