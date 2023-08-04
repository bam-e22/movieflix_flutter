import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/constants/movie_api.dart';
import 'package:movieflix/movie/models/movie_model.dart';

class MovieRepository {
  final String _popular = "popular";

  Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMovies = [];
    final url = Uri.parse('${MovieApi.baseUrl}/$_popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (var json in jsonDecode(response.body)['results']) {
        final popularMovie = MovieModel.fromJson(json);
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
