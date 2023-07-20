import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/dto/moviedb/moviedb_dto.dart';

class MovieMapper {
  static Movie movieBDToEntity(MovieDbDTO movieDb) => Movie(
      id: movieDb.id,
      adult: movieDb.adult,
      title: movieDb.title,
      video: movieDb.video,
      overview: movieDb.overview,
      voteCount: movieDb.voteCount,
      popularity: movieDb.popularity,
      releaseDate: movieDb.releaseDate,
      voteAverage: movieDb.voteAverage,
      originalTitle: movieDb.originalTitle,
      originalLanguage: movieDb.originalLanguage,
      posterPath: (movieDb.posterPath.isNotEmpty)
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
          : 'no-poster',
      backdropPath: (movieDb.backdropPath.isNotEmpty)
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
          : 'https://www.tgv.com.my/assets/images/404/movie-poster.jpg',
      genreIds: movieDb.genreIds.map((item) => item.toString()).toList());
}
