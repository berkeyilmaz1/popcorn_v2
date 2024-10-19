import 'package:flutter/widgets.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_cubit.dart';
import 'package:popcorn_v2/features/favorites/view/favorites_view.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

mixin FavoritesViewMixin on State<FavoritesView>, BaseState<FavoritesView> {
  late final FavoriteCubit _favoriteCubit;
  FavoriteCubit get favoriteCubit => _favoriteCubit;

  @override
  void initState() {
    super.initState();

    setupCubit();
    fetchFavoriteMovies();
  }

  void setupCubit() {
    _favoriteCubit = FavoriteCubit(
      movieService: MovieService(networkManager: networkManager),
    );
  }

  Future<void> fetchFavoriteMovies() async {
    await _favoriteCubit.getFavoriteMovies();
  }
}
