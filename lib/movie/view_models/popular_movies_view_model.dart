import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/movie/models/movie_model.dart';
import 'package:movieflix/movie/repos/movie_repository.dart';

class PopularMoviesViewModel
    extends AutoDisposeAsyncNotifier<List<MovieModel>> {
  late final MovieRepository _movieRepository;
  List<MovieModel> _cache = [];

  @override
  FutureOr<List<MovieModel>> build() async {
    _movieRepository = ref.read(movieRepoProvider);
    _cache = await _fetchPopularMovies();
    return _cache;
  }

  Future<List<MovieModel>> _fetchPopularMovies() async {
    return await _movieRepository.getPopularMovies();
  }
}

final popularMoviesProvider = AsyncNotifierProvider.autoDispose<
    PopularMoviesViewModel, List<MovieModel>>(
  () => PopularMoviesViewModel(),
);
