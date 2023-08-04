class PopularMovie {
  const PopularMovie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  PopularMovie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        posterPath = json['poster_path'];

  final int id;
  final String title;
  final String overview;
  final String posterPath;

  @override
  String toString() {
    return "[$id]\n $title\n $overview\n $posterPath }";
  }
}
