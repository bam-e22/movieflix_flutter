class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.releaseDate,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        popularity = json['popularity'],
        releaseDate = json['release_date'];

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;

  final double popularity;
  final String releaseDate;

  @override
  String toString() {
    return "[$id] $title $releaseDate\n";
  }
}
