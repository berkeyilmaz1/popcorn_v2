import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/features/movie_detail/view/mixin/movie_detail_view_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class MovieDetailView extends StatefulWidget {
  const MovieDetailView({
    required this.movie,
    super.key,
  });
  final Movie movie;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView>
    with MovieDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => homecubit,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MovieInfoHeader(movie: widget.movie),
                    Positioned(
                      bottom:
                          -(WidgetSizes.spacingXxl12 + WidgetSizes.spacingL),
                      left: WidgetSizes.spacingZero,
                      right: WidgetSizes.spacingZero,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: MovieCard(
                              imageUrl: widget.movie.posterPath ?? '',
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const PagePadding.horizontal16Symmetric(),
                              child: _TitleYearPoint(movie: widget.movie),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                MovieInfoFooter(movie: movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _TitleYearPoint extends StatelessWidget {
  const _TitleYearPoint({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.originalTitle ?? '',
          style: const TextStyle(
            color: ProductColors.white,
            fontWeight: FontWeight.bold,
            fontSize: WidgetSizes.spacingL,
          ),
        ),
        Text(
          movie.releaseDate ?? '',
          style: const TextStyle(color: ProductColors.white),
        ),
        const SizedBox(height: WidgetSizes.spacingXs),
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: WidgetSizes.spacingXxl1,
            ),
            Column(
              children: [
                Text(
                  movie.voteAverage!.toStringAsFixed(1),
                  style: const TextStyle(
                    color: ProductColors.white,
                    fontSize: WidgetSizes.spacingMx,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movie.voteCount.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

///todo add part part of ---- make shader mask custom widget that takes child

final class MovieInfoHeader extends StatelessWidget {
  const MovieInfoHeader({required this.movie, super.key});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ProductColors.black,
                Colors.transparent,
              ],
              stops: [WidgetSizes.spacingZero, WidgetSizes.spacingXSSs],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final images = state.movieImages?.first;
              return CachedNetworkImage(
                imageUrl: ServicePaths.posterPath(
                  images?.filePath ?? '',
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: ProductColors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: ProductColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MovieInfoFooter extends StatelessWidget {
  const MovieInfoFooter({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: WidgetSizes.spacingXxl12 + WidgetSizes.spacingXsMid,
          ),
          const Text(
            LocaleKeys.detail_overview,
            style: TextStyle(
                color: ProductColors.white, fontWeight: FontWeight.bold),
          ).tr(),
          Text(
            movie.overview ?? '',
            style: const TextStyle(
              color: ProductColors.white,
            ),
            maxLines: WidgetSizes.spacingXSs.truncate(),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: WidgetSizes.spacingXsMid,
          ),
          const Text(
            LocaleKeys.detail_images,
            style: TextStyle(
                color: ProductColors.white, fontWeight: FontWeight.bold),
          ).tr(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final images = state.movieImages;
              return SizedBox(
                height: WidgetSizes.spacingXxlL12,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCard(
                      imageUrl: ServicePaths.posterPath(
                        images?[index].filePath ?? '',
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
