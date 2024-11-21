import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_cubit.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_state.dart';
import 'package:popcorn_v2/features/favorites/view/mixin/favorites_view_mixin.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/localization/locale_keys.g.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/theme/product_colors.dart';
import 'package:popcorn_v2/product/utils/constants/product_styles.dart';
import 'package:popcorn_v2/product/widgets/movie_card.dart';
import 'package:popcorn_v2/product/widgets/movie_rating.dart';
import 'package:popcorn_v2/product/widgets/widget_sizes.dart';

part '../widgets/dismissible_movie_card.dart';

final class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView>
    with BaseState, FavoritesViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favoriteCubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            LocaleKeys.favorites_favorites,
            style: ProductStyles.instance.onboardTitle,
          ).tr(),
        ),
        body: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.favoriteMovies?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                if (state.favoriteMovies == null) {
                  return const CircularProgressIndicator();
                }

                final movie = state.favoriteMovies![index];

                return DismissibleMovieCard(
                  movie: movie,
                  flexValue: flexValue,
                  onTapped: () async => navigateToDetail(context, movie),
                  movieKey: movie.id.toString(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
