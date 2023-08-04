import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/movie/models/popular_movies_model.dart';
import 'package:movieflix/movie/repos/movie_repository.dart';

class PopularMoviesViewModel
    extends AutoDisposeAsyncNotifier<List<PopularMovie>> {
  late final MovieRepository _movieRepository;
  List<PopularMovie> _cache = [];

  @override
  FutureOr<List<PopularMovie>> build() async {
    _movieRepository = ref.read(movieRepoProvider);
    _cache = await _fetchPopularMovies();
    return _cache;
  }

  Future<List<PopularMovie>> _fetchPopularMovies() async {
    return await _movieRepository.getPopularMovies();
  }
}

final popularMoviesProvider = AsyncNotifierProvider.autoDispose<
    PopularMoviesViewModel, List<PopularMovie>>(
  () => PopularMoviesViewModel(),
);
