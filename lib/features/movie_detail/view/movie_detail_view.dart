import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/features/movie_detail/view/mixin/movie_detail_view_mixin.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/theme/product_colors.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

final class MovieDetailView extends StatefulWidget {
  const MovieDetailView({
    required this.movie,
    required this.homeCubit,
    super.key,
  });
  final Movie movie;
  final HomeCubit homeCubit;

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView>
    with MovieDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => homeCubit,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieInfoHeader(
                  movie: movie,
                ),
                Padding(
                  padding: const PagePadding.all(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height:
                            WidgetSizes.spacingXxl12 + WidgetSizes.spacingXxl7,
                      ),
                      const Text(
                        LocaleKeys.detail_overview,
                        style: TextStyle(color: Colors.white),
                      ).tr(),
                      Text(
                        movie.overview ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: WidgetSizes.spacingXSs.truncate(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(LocaleKeys.detail_images).tr(),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          final images = state.movieImages;
                          return SizedBox(
                            height: WidgetSizes.spacingXxlL13,
                            child: ListView.builder(
                              itemCount: images?.length ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                return CachedNetworkImage(
                                  imageUrl: images?[index].filePath ?? '',
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
              stops: [0.0, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            imageUrl:
                'https://image.tmdb.org/t/p/w500/yDHYTfA3R0jFYba16jBB1ef8oIt.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -120,
          left: 0,
          child: Row(
            children: [
              SizedBox(
                width: WidgetSizes.spacingXxl12 + WidgetSizes.spacingXxl7,
                child: MovieCard(imageUrl: movie.posterPath ?? ''),
              ),
              Padding(
                padding: const PagePadding.all(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.originalTitle ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: WidgetSizes.spacingL,
                      ),
                    ),
                    Text(
                      movie.releaseDate ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: WidgetSizes.spacingXs),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                          size: WidgetSizes.spacingXxl1,
                        ),
                        Text(
                          '${movie.voteAverage}\n${movie.voteCount}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
