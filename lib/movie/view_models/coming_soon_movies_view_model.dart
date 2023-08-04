import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/movie/models/movie_model.dart';
import 'package:movieflix/movie/repos/movie_repository.dart';

class ComingSoonMoviesViewModel
    extends AutoDisposeAsyncNotifier<List<MovieModel>> {
  late final MovieRepository _movieRepository;
  List<MovieModel> _cache = [];

  @override
  FutureOr<List<MovieModel>> build() async {
    _movieRepository = ref.read(movieRepoProvider);
    _cache = await _fetch();
    return _cache;
  }

  Future<List<MovieModel>> _fetch() async {
    return await _movieRepository.getComingSoonMovies();
  }
}

final comingSoonMoviesProvider = AsyncNotifierProvider.autoDispose<
    ComingSoonMoviesViewModel, List<MovieModel>>(
  () => ComingSoonMoviesViewModel(),
);
