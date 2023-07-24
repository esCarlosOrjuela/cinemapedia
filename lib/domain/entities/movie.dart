class Movie {
  final int id;
  final bool adult;
  final bool video;
  final String title;
  final int voteCount;
  final String overview;
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final String backdropPath;
  final DateTime? releaseDate;
  final String originalTitle;
  final List<String> genreIds;
  final String originalLanguage;

  Movie({
    required this.id,
    required this.adult,
    required this.title,
    required this.video,
    required this.genreIds,
    required this.overview,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.originalLanguage,
  });
}