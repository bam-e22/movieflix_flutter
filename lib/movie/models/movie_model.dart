class MovieModel {
  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        backdropPath = json['backdrop_path'];

  final int id;
  final String title;
  final String overview;
  final String backdropPath;

  @override
  String toString() {
    return "[$id]\n $title\n $overview\n $backdropPath";
  }
}
