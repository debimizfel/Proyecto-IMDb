class Pelicula {
  Pelicula({
    required this.originalTitle,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.id,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      originalTitle: json['original_title'],
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'],
      voteAverage: json['vote_average'] * 1.0,
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: DateTime.parse(json['release_date'] ?? ''),
      id: json['id'].toString(),
    );
  }
  factory Pelicula.fromMyJson(Map<String, dynamic> json) {
    return Pelicula(
      originalTitle: json['originaTitle'],
      posterPath: json['posterPath'] ?? '',
      overview: json['overview'],
      voteAverage: json['voteAverage'] * 1.0,
      backdropPath: json['backdropPath'] ?? '',
      releaseDate: DateTime.parse(json['releaseDate'] ?? 'hola'),
      id: json['id'].toString(),
    );
  }
  final String originalTitle;
  final String posterPath;
  final String overview;
  final double voteAverage;
  final String backdropPath;
  final DateTime releaseDate;
  final String id;
}
