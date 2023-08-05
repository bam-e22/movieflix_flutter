import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/movie/models/movie_detail_model.dart';
import 'package:movieflix/movie/repos/movie_repository.dart';

class MovieDetailViewModel extends FamilyAsyncNotifier<MovieDetailModel, int> {
  late final MovieRepository _movieRepository;
  late final int _movieId;

  @override
  FutureOr<MovieDetailModel> build(int arg) async {
    _movieId = arg;
    _movieRepository = ref.read(movieRepoProvider);
    return await _movieRepository.getMovieDetail(_movieId);
  }
}

final movieDetailProvider =
    AsyncNotifierProvider.family<MovieDetailViewModel, MovieDetailModel, int>(
  () => MovieDetailViewModel(),
);
