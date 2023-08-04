import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/movie/components/MoviePoster.dart';
import 'package:movieflix/movie/models/movie_model.dart';

class MovieBackdrops extends ConsumerWidget {
  const MovieBackdrops({
    super.key,
    this.imageWidth = 350,
    this.imageHeight = 250,
    required this.movies,
  });

  final double imageWidth;
  final double imageHeight;
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return MoviePoster(
          posterUrl:
              "https://image.tmdb.org/t/p/w500/${movies[index].backdropPath}",
          onTap: () {},
          width: imageWidth,
          height: imageHeight,
        );
      },
      separatorBuilder: (context, index) => Gaps.h20,
      itemCount: movies.length,
    );
  }
}
