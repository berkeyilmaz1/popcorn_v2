import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/features/home/view/mixin/home_view_mixin.dart';
import 'package:popcorn_v2/features/movie_detail/view/movie_detail_view.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/widgets/highlight_movie.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/movie_and_title.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState, HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar( 
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                size: WidgetSizes.spacingXxl1,
                color: ProductColors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final popularMovie = state.popularMovies?.first;
            if (popularMovie == null) return const SizedBox.shrink();
            return SingleChildScrollView(
              child: Column(
                children: [
                  ///todo: add other movies
                  HighlightMovie(
                    onTap: () => navigateToDetail(context, popularMovie),
                    imageUrl: state.highlightMovie?.first.filePath ?? '',
                    movieTitle: state.popularMovies?.first.title ?? '',
                  ),
                  MovieAndTitle(
                    title: LocaleKeys.home_popularMovies,
                    itemCount: state.popularMovies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final popularMovie = state.popularMovies?[index];
                      if (state.popularMovies == null) const SizedBox.shrink();
                      return MovieCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<MovieDetailView>(
                            builder: (context) => MovieDetailView(
                              movie: popularMovie!,
                            ),
                          ),
                        ),
                        imageUrl: popularMovie?.posterPath,
                        movieTitle: popularMovie?.title,
                      );
                    },
                  ),
                  MovieAndTitle(
                    title: LocaleKeys.home_topRated,
                    itemCount: state.topRatedMovies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final topRatedMovie = state.topRatedMovies?[index];
                      if (state.topRatedMovies == null) const SizedBox.shrink();
                      return MovieCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<MovieDetailView>(
                            builder: (context) => MovieDetailView(
                              movie: topRatedMovie!,
                            ),
                          ),
                        ),
                        imageUrl: topRatedMovie?.posterPath,
                        movieTitle: topRatedMovie?.title,
                      );
                    },
                  ),
                  MovieAndTitle(
                    title: LocaleKeys.home_upcoming,
                    itemCount: state.upcomingMovies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final upcomingMovie = state.upcomingMovies?[index];
                      if (state.upcomingMovies == null) const SizedBox.shrink();
                      return MovieCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<MovieDetailView>(
                            builder: (context) => MovieDetailView(
                              movie: upcomingMovie!,
                            ),
                          ),
                        ),
                        imageUrl: upcomingMovie?.posterPath,
                        movieTitle: upcomingMovie?.title,
                      );
                    },
                  ),
                  MovieAndTitle(
                    title: LocaleKeys.home_nowPlaying,
                    itemCount: state.nowPlayingMovies?.length ?? 0,
                    itemBuilder: (context, index) {
                      final nowPlayingMovie = state.nowPlayingMovies?[index];
                      // ignore: lines_longer_than_80_chars
                      if (state.nowPlayingMovies == null) {
                        const SizedBox.shrink();
                      }
                      return MovieCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<MovieDetailView>(
                            builder: (context) => MovieDetailView(
                              movie: nowPlayingMovie!,
                            ),
                          ),
                        ),
                        imageUrl: nowPlayingMovie?.posterPath,
                        movieTitle: nowPlayingMovie?.title,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
