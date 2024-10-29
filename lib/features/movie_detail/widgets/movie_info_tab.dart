import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part 'tab_views/movie_cast.dart';
part 'tab_views/movie_images.dart';
part 'tab_views/movie_overview.dart';

enum DetailTabItems { overview, cast, images }

final class MovieInfoTab extends StatefulWidget {
  const MovieInfoTab({required this.movie, super.key});
  final Movie movie;

  @override
  State<MovieInfoTab> createState() => _MovieInfoTabState();
}

class _MovieInfoTabState extends State<MovieInfoTab>
    with BaseState<MovieInfoTab>, MovieInfoTabMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: DetailTabItems.values.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: LocaleKeys.detail_overview.tr()),
              Tab(text: LocaleKeys.detail_cast.tr()),
              Tab(text: LocaleKeys.detail_images.tr()),
            ],
          ),
          BlocProvider(
            create: (context) => homeCubit,
            child: SizedBox(
              height: WidgetSizes.spacingXxlL14,
              child: TabBarView(
                children: [
                  MovieOverview(movie: widget.movie),
                  const MovieCast(),
                  const MovieImages(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin MovieInfoTabMixin on State<MovieInfoTab>, BaseState<MovieInfoTab> {
  late final HomeCubit _homeCubit;
  HomeCubit get homeCubit => _homeCubit;
  @override
  void initState() {
    super.initState();
    setupCubit();
    fetchCast(widget.movie.id.toString());
    fetchImages();
  }

  void setupCubit() {
    _homeCubit =
        HomeCubit(movieService: MovieService(networkManager: networkManager));
  }

  Future<void> fetchImages() async {
    await homeCubit.getMovieImages(widget.movie.id.toString());
  }

  Future<void> fetchCast(String movieId) async {
    await _homeCubit.getMovieCast(movieId);
  }
}
