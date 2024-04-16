class FeaturedMovieModel {
  final String originalTitle, overview, posterPath, releaseDate;
  final int id;
  final double rating;

  factory FeaturedMovieModel.fromJson(Map<String, dynamic> json) {
    return FeaturedMovieModel(
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        id: json['id'],
        // country: json['production_companies'][0]['origin_country'],
        releaseDate: json['release_date'],
        // run_time: json['runtime'],
        // genre: json['genres'],
        rating: json['vote_average']);
  }

  FeaturedMovieModel({
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.id,
    required this.rating,
  });
}
