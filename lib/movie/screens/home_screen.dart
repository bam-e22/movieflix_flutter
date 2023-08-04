import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieflix/constants/gaps.dart';
import 'package:movieflix/constants/sizes.dart';
import 'package:movieflix/movie/components/MovieBackdrops.dart';
import 'package:movieflix/movie/components/MoviePoster.dart';
import 'package:movieflix/movie/view_models/popular_movies_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

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
                const MovieBackdrops(),
                Gaps.v32,
                Text(
                  'Now in Cinemas',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.v16,
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.teal,
                ),
                Gaps.v10,
                Container(
                  width: 150,
                  height: 90,
                  color: Colors.teal,
                ),
                Gaps.v32,
                Text(
                  'Coming soon',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Gaps.v16,
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.lightBlue,
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
