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
import 'package:popcorn_v2/product/utils/border_radius_general.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/movie_rating.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/movie_background.dart';
part '../widgets/movie_detail_bottom_app_bar.dart';
part '../widgets/movie_information.dart';
part '../widgets/movie_poster_and_rating.dart';

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
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                onPressed: favoriteLogics,
                icon: isLiked
                    ? const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          bottomNavigationBar: const MovieDetailBottomAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MovieBackground(movie: widget.movie),
                    MoviePosterAndRating(widget: widget),
                  ],
                ),
                MovieInformation(movie: movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
