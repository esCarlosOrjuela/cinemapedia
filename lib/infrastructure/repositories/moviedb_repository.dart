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
}
