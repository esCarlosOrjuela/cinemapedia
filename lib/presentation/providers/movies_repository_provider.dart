import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/moviedb_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider => Provider de solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MovieRepository(MovieDbDataSource());
});
