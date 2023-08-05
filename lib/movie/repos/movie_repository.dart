import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movieflix/movie/models/movie_detail_model.dart';
import 'package:movieflix/movie/models/movie_model.dart';

class MovieRepository {
  final String _baseUrl = "https://movies-api.nomadcoders.workers.dev";
  final String _popular = "popular";
  final String _nowPlaying = "now-playing";
  final String _comingSoon = "coming-soon";

  Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movies = [];
    final url = Uri.parse('$_baseUrl/$_popular');
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

  Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> movies = [];
    final url = Uri.parse('$_baseUrl/$_nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieResponse = jsonDecode(response.body);
      final dates = movieResponse['dates'];
      final minimumDate = DateTime.parse(dates['minimum']);
      final maximumDate = DateTime.parse(dates['maximum']);

      for (var json in jsonDecode(response.body)['results']) {
        final popularMovie = MovieModel.fromJson(json);
        movies.add(popularMovie);
      }
      return movies.where((movie) {
        final releaseDate = DateTime.parse(movie.releaseDate);
        return releaseDate
                .isAfter(minimumDate.subtract(const Duration(days: 1))) &&
            releaseDate.isBefore(maximumDate.add(const Duration(days: 1)));
      }).toList();
    }
    throw Error();
  }

  Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> movies = [];
    final url = Uri.parse('$_baseUrl/$_comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieResponse = jsonDecode(response.body);
      final dates = movieResponse['dates'];
      final minimumDate = DateTime.parse(dates['minimum']);

      for (var json in jsonDecode(response.body)['results']) {
        final popularMovie = MovieModel.fromJson(json);
        movies.add(popularMovie);
      }
      return movies.where((movie) {
        final releaseDate = DateTime.parse(movie.releaseDate);
        return releaseDate
            .isAfter(minimumDate.subtract(const Duration(days: 1)));
      }).toList();
    }
    throw Error();
  }

  Future<MovieDetailModel> getMovieDetail(int id) async {
    final url = Uri.parse('$_baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movieDetail = MovieDetailModel.fromJson(jsonDecode(response.body));
      return movieDetail;
    }
    throw Error();
  }
}

final movieRepoProvider = Provider(
  (ref) => MovieRepository(),
);
