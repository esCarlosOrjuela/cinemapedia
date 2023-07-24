import 'package:cinemapedia/domain/entities/movie.dart';
import '../../domain/datasources/imovies_datasource.dart';
import '../../domain/repositories/imovies_repository.dart';

class MovieRepository extends IMoviesRepository {
  final IMoviesDataSource dataSource;

  MovieRepository(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> gePopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }
  
  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}
