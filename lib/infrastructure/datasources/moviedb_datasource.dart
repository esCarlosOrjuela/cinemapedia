import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/dto/moviedb/movie_details_dto.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';
import '../../domain/datasources/imovies_datasource.dart';
import '../dto/moviedb/moviedb_response_dto.dart';

class Endpoints {
  static String pathNowPlaying = 'movie/now_playing';
  static String pathPopular = 'movie/popular';
  static String pathUpcoming = 'movie/upcoming';
  static String pathTopRated = 'movie/top_rated';
  static String pathMovieById = 'movie/';
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

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDBResponse = MoveDbResponseDTO.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        .where((movieDb) => movieDb.posterPath != 'no-poster')
        .map((movieDb) => MovieMapper.movieBDToEntity(movieDb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio
        .get(Endpoints.pathNowPlaying, queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio
        .get(Endpoints.pathNowPlaying, queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get(Endpoints.pathTopRated, queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get(Endpoints.pathUpcoming, queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('${Endpoints.pathMovieById}/$id');

    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }

    final movieDB = MovieDetailsDTO.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDB);
    return movie;
  }
}
