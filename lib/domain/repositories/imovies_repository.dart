import 'package:cinemapedia/domain/entities/movie.dart';

// Contrato que debera implementar un repositorio de peliculas para comunicarse con el DataSource de peliculas
abstract class IMoviesRepository{
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> gePopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<Movie> getMovieById(String id);
}