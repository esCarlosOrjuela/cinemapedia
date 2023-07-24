class MovieDetailsDTO {
  final int id;
  final bool adult;
  final int budget;
  final bool video;
  final int revenue;
  final int runtime;
  final String title;
  final String status;
  final String imdbId;
  final int voteCount;
  final String tagline;
  final String homepage;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<Genre> genres;
  final double voteAverage;
  final String backdropPath;
  final String originalTitle;
  final DateTime releaseDate;
  final String originalLanguage;
  final List<SpokenLanguage> spokenLanguages;
  final BelongsToCollection? belongsToCollection;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;

  MovieDetailsDTO({
    required this.id,
    required this.adult,
    required this.video,
    required this.title,
    required this.imdbId,
    required this.budget,
    required this.status,
    required this.genres,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.homepage,
    required this.overview,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.originalTitle,
    required this.spokenLanguages,
    required this.originalLanguage,
    required this.belongsToCollection,
    required this.productionCompanies,
    required this.productionCountries,
  });

  factory MovieDetailsDTO.fromJson(Map<String, dynamic> json) => MovieDetailsDTO(
        id: json["id"],
        adult: json["adult"],
        title: json["title"],
        video: json["video"],
        budget: json["budget"],
        status: json["status"],
        imdbId: json["imdb_id"],
        tagline: json["tagline"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        homepage: json["homepage"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteCount: json["vote_count"],
        originalTitle: json["original_title"],
        backdropPath: json["backdrop_path"] ?? '',
        popularity: json["popularity"]?.toDouble(),
        originalLanguage: json["original_language"],
        voteAverage: json["vote_average"]?.toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        belongsToCollection: json["belongs_to_collection"] == null
            ? null
            : BelongsToCollection.fromJson(json["belongs_to_collection"]),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
                spokenLanguages: List<SpokenLanguage>.from( json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        productionCompanies: List<ProductionCompany>.from( json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from( json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adult": adult,
        "title": title,
        "video": video,
        "budget": budget,
        "status": status,
        "imdb_id": imdbId,
        "tagline": tagline,
        "revenue": revenue,
        "runtime": runtime,
        "homepage": homepage,
        "overview": overview,
        "vote_count": voteCount,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
      };
}

class BelongsToCollection {
  final int id;
  final String name;
  final String posterPath;
  final dynamic backdropPath;

  BelongsToCollection({
    required this.id,
    this.backdropPath,
    required this.name,
    required this.posterPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompany({
    this.logoPath,
    required this.id,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        name: json["name"],
        logoPath: json["logo_path"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo_path": logoPath,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  final String name;
  final String iso31661;

  ProductionCountry({
    required this.name,
    required this.iso31661,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        name: json["name"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "iso_3166_1": iso31661,
      };
}

class SpokenLanguage {
  final String name;
  final String iso6391;
  final String englishName;

  SpokenLanguage({
    required this.name,
    required this.iso6391,
    required this.englishName,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        name: json["name"],
        iso6391: json["iso_639_1"],
        englishName: json["english_name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "iso_639_1": iso6391,
        "english_name": englishName,
      };
}
