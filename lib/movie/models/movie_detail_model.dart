class MovieDetailModel {
  MovieDetailModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.genres,
    required this.runtime,
    required this.posterPath,
    required this.voteAverage,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        genres = (json['genres'] as List<dynamic>)
            .map((element) => Genre.fromJson(element))
            .toList(),
        runtime = json['runtime'],
        posterPath = json['poster_path'],
        voteAverage = json['vote_average'];

  final int id;
  final String title;
  final String overview;
  final List<Genre> genres;
  final int runtime;
  final String posterPath;
  final double voteAverage;

  @override
  String toString() {
    return '[$id] $title $runtime $voteAverage $genres';
  }
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  final int id;
  final String name;

  @override
  String toString() {
    return name;
  }
}
