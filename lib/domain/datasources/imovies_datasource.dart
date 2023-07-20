import 'package:cinemapedia/domain/entities/movie.dart';

// Contrato que debera implementar un Datasource de peliculas
abstract class IMoviesDataSource{
  Future<List<Movie>> getNowPlaying({int page = 1});
}