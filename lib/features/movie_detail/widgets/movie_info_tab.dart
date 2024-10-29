import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/page/page_padding.dart';

part 'info_views.dart';

enum DetailTabItems { overview, cast, images }

final class MovieInfoTab extends StatefulWidget {
  const MovieInfoTab({required this.movie, super.key});
  final Movie movie;

  @override
  State<MovieInfoTab> createState() => _MovieInfoTabState();
}

class _MovieInfoTabState extends State<MovieInfoTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: DetailTabItems.values.length,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Cast'),
              Tab(text: 'Images'),
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                MovieOverview(movie: widget.movie),
                const Placeholder(),
                const MovieImages(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
