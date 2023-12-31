import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/movie/components/movie_poster.dart';
import 'package:movieflix/movie/models/movie_model.dart';

class Movies extends ConsumerWidget {
  const Movies({
    super.key,
    this.imageWidth = 150,
    this.imageHeight = 200,
    required this.movies,
    required this.onTap,
  });

  final double imageWidth;
  final double imageHeight;
  final List<MovieModel> movies;
  final Function(int movieId) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviePoster(
              posterUrl:
                  "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
              onTap: () => onTap(movies[index].id),
              width: imageWidth,
              height: imageHeight,
            ),
            Gaps.v10,
            Expanded(
              child: SizedBox(
                width: imageWidth,
                child: Text(
                  movies[index].title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => Gaps.h20,
      itemCount: movies.length,
    );
  }
}
