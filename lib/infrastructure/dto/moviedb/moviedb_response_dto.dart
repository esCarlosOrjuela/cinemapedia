import 'dates_dto.dart';
import 'moviedb_dto.dart';

class MoveDbResponseDTO {
  final int page;
  final int totalPages;
  final DatesDTO? dates;
  final int totalResults;
  final List<MovieDbDTO> results;

  MoveDbResponseDTO({
    required this.page,
    required this.dates,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoveDbResponseDTO.fromJson(Map<String, dynamic> json) =>
      MoveDbResponseDTO(
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
        dates: (json["dates"] != null) ? DatesDTO.fromJson(json["dates"]) : null,
        results: List<MovieDbDTO>.from(
            json["results"].map((x) => MovieDbDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total_pages": totalPages,
        "total_results": totalResults,
        "dates": (dates == null) ? null : dates!.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

// MoveDbResponseDTO moveDbResponseFromJson(String str) => MoveDbResponseDTO.fromJson(json.decode(str));

// String moveDbResponseToJson(MoveDbResponseDTO data) => json.encode(data.toJson());




