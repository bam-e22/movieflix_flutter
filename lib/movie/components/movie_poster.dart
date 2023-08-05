import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/constants/sizes.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.posterUrl,
    required this.onTap,
    required this.width,
    required this.height,
  });

  final String posterUrl;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.size10),
        clipBehavior: Clip.hardEdge,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: posterUrl,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
