import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/features/movie_detail/view/mixin/movie_detail_view_mixin.dart';
import 'package:popcorn_v2/features/movie_detail/widgets/movie_info_tab.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/movie_rating.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';
import 'package:url_launcher/url_launcher.dart';

part '../widgets/movie_background.dart';
part '../widgets/movie_poster_and_rating.dart';
part '../widgets/watch_trailer_button.dart';

@RoutePage()
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
    return BlocProvider(
      create: (context) => homecubit,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: WatchTrailerButton(
          movie: widget.movie,
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          actions: [
            IconButton(
              onPressed: favoriteLogics,
              icon: Icon(
                isLiked
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: isLiked ? Colors.red : ProductColors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                MovieBackground(movie: widget.movie),
                MoviePosterAndRating(movie: widget.movie),
              ],
            ),
            const SizedBox(
              height: WidgetSizes.spacingL + WidgetSizes.spacingXxl12,
            ),
            MovieInfoTab(
              movie: widget.movie,
            ),
          ],
        ),
      ),
    );
  }
}
