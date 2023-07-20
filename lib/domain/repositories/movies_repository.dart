import 'package:cinemapedia/domain/entities/movie.dart';

// Contrato que debera implementar un repositorio de peliculas para comunicarse con el DataSource de peliculas
abstract class MovieDataSource{
  Future<List<Movie>> getNowPlaying({int page = 1});
}