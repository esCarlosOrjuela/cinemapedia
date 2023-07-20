class MovieDbDTO {
    final int id;
    final bool adult;
    final bool video;
    final String title;
    final int voteCount;
    final String overview;
    final String posterPath;
    final double popularity;
    final double voteAverage;
    final List<int> genreIds;
    final String backdropPath;
    final String originalTitle;
    final DateTime releaseDate;
    final String originalLanguage;

    MovieDbDTO({
        required this.id,
        required this.adult,
        required this.video,
        required this.title,
        required this.overview,
        required this.genreIds,
        required this.voteCount,
        required this.posterPath,
        required this.popularity,
        required this.releaseDate,
        required this.voteAverage,
        required this.backdropPath,
        required this.originalTitle,
        required this.originalLanguage,
    });

    factory MovieDbDTO.fromJson(Map<String, dynamic> json) => MovieDbDTO(
        id: json["id"],
        title: json["title"],
        video: json["video"],
        voteCount: json["vote_count"],
        adult: json["adult"] ?? false,
        overview: json["overview"] ?? '',
        originalTitle: json["original_title"],
        posterPath: json["poster_path"] ?? '',
        backdropPath: json["backdrop_path"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "video": video,
        "title": title,
        "adult": adult,
        "overview": overview,
        "vote_count": voteCount,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    };
}