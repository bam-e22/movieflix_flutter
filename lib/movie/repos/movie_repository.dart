import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/constants/movie_api.dart';
import 'package:movieflix/movie/models/popular_movies_model.dart';

class MovieRepository {
  final String _popular = "popular";

  Future<List<PopularMovie>> getPopularMovies() async {
    List<PopularMovie> popularMovies = [];
    final url = Uri.parse('${MovieApi.baseUrl}/$_popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (var json in jsonDecode(response.body)['results']) {
        final popularMovie = PopularMovie.fromJson(json);
        popularMovies.add(popularMovie);
      }
      return popularMovies;
    }
    throw Error();
  }
}

final movieRepoProvider = Provider(
  (ref) => MovieRepository(),
);
