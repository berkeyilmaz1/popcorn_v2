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
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/movie_info_footer.dart';
part '../widgets/movie_info_header.dart';
part '../widgets/movie_rating.dart';

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
                              child: MovieRating(movie: widget.movie),
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
