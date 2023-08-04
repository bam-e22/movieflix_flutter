import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/constants/movie_api.dart';
import 'package:movieflix/movie/models/movie_model.dart';

class MovieRepository {
  final String _popular = "popular";
  final String _nowPlaying = "now-playing";
  final String _comingSoon = "coming-soon";

  Future<List<MovieModel>> getPopularMovies() async {
    return await _getMovies(_popular);
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    return await _getMovies(_nowPlaying);
  }

  Future<List<MovieModel>> getComingSoonMovies() async {
    return await _getMovies(_comingSoon);
  }

  Future<List<MovieModel>> _getMovies(String path) async {
    List<MovieModel> movies = [];
    final url = Uri.parse('${MovieApi.baseUrl}/$path');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      for (var json in jsonDecode(response.body)['results']) {
        final popularMovie = MovieModel.fromJson(json);
        movies.add(popularMovie);
      }
      return movies;
    }
    throw Error();
  }
}

final movieRepoProvider = Provider(
  (ref) => MovieRepository(),
);
