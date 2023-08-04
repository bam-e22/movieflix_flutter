import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/movie/components/MoviePoster.dart';
import 'package:movieflix/movie/view_models/popular_movies_view_model.dart';

class MovieBackdrops extends ConsumerWidget {
  const MovieBackdrops({super.key});

  final double width = 350;
  final double height = 250;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: ref.watch(popularMoviesProvider).when(
        data: (popularMovies) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MoviePoster(
                posterUrl:
                    "https://image.tmdb.org/t/p/w500/${popularMovies[index].backdropPath}",
                onTap: () {},
                width: width,
                height: height,
              );
            },
            separatorBuilder: (context, index) => Gaps.h20,
            itemCount: popularMovies.length,
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
    );
  }
}
