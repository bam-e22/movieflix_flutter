import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/constants/sizes.dart';
import 'package:movieflix/movie/components/movie_backdrops.dart';
import 'package:movieflix/movie/components/movies.dart';
import 'package:movieflix/movie/screens/detail_screen.dart';
import 'package:movieflix/movie/view_models/coming_soon_movies_view_model.dart';
import 'package:movieflix/movie/view_models/now_playing_movies_view_model.dart';
import 'package:movieflix/movie/view_models/popular_movies_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _onMovieTap(BuildContext context, int movieId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          movieId: movieId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  'Popular Movies',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.v16,
                SizedBox(
                  height: 250,
                  child: ref.watch(popularMoviesProvider).when(
                    data: (data) {
                      return MovieBackdrops(
                        movies: data,
                        onTap: (movieId) => _onMovieTap(context, movieId),
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(
                          'Could not load movies',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Gaps.v32,
                Text(
                  'Now in Cinemas',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.v16,
                SizedBox(
                  height: 270,
                  child: ref.watch(nowPlayingMoviesProvider).when(
                    data: (data) {
                      return Movies(
                        movies: data,
                        onTap: (movieId) => _onMovieTap(context, movieId),
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(
                          'Could not load movies',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Gaps.v16,
                Text(
                  'Coming soon',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.v16,
                SizedBox(
                  height: 250,
                  child: ref.watch(comingSoonMoviesProvider).when(
                    data: (data) {
                      return Movies(
                        movies: data,
                        onTap: (movieId) => _onMovieTap(context, movieId),
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(
                          'Could not load movies',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Gaps.v32,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
