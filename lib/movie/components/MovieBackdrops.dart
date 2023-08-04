import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/movie/components/MoviePoster.dart';
import 'package:movieflix/movie/view_models/popular_movies_view_model.dart';

class MovieBackdrops extends ConsumerWidget {
  const MovieBackdrops({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(popularMoviesProvider).when(
      data: (popularMovies) {
        return SizedBox(
          height: 250,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MoviePoster(
                posterUrl:
                    "https://image.tmdb.org/t/p/w500/${popularMovies[index].backdropPath}",
                onTap: () {},
                width: 350,
                height: 250,
              );
            },
            separatorBuilder: (context, index) => Gaps.h20,
            itemCount: popularMovies.length,
          ),
        );
      },
      error: (error, stackTrace) {
        print("Could not load movies: $error");
        return SizedBox(
          height: 250,
          child: Center(
            child: Text(
              'Could not load movies',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
      },
      loading: () {
        return const SizedBox(
          height: 250,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
