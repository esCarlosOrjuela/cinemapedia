import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';
import '../../domain/datasources/imovies_datasource.dart';
import '../dto/moviedb/moviedb_response_dto.dart';

class Endpoints {
  static String pathNowPlaying = 'movie/now_playing';
}

///  Clase que implementa el contrato para conectar a un datasource a peliculas: MovieDb
class MovieDbDataSource extends IMoviesDataSource {
  /// Usamos el paquete dio (para peticiones HTTP)
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-CO'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(Endpoints.pathNowPlaying);
    final jsonResponse = response.data;
    final movieDBResponse = MoveDbResponseDTO.fromJson(jsonResponse);
    final List<Movie> movies = movieDBResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.movieBDToEntity(movieDb))
        .toList();

    return movies;
  }
}
