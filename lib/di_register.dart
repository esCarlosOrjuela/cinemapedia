import 'package:cinemapedia/domain/repositories/imovies_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/moviedb_repository.dart';
import 'package:get_it/get_it.dart';

void diSetup() {
  final getIt = GetIt.instance;
  final dataSource = MovieDbDataSource();

  getIt.registerLazySingleton<IMoviesRepository>(
    () => MovieRepository(dataSource),
  );
}
