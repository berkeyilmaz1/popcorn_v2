import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/movie_detail/view/movie_detail_view.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/favorite_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

mixin MovieDetailViewMixin on State<MovieDetailView> {
  late final Movie _movie;
  Movie get movie => _movie;

  late final HomeCubit _homecubit;
  HomeCubit get homecubit => _homecubit;

  late final FavoriteCubit _favoriteCubit;
  FavoriteCubit get favoriteCubit => _favoriteCubit;

  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    setupCubits();
    fetchImages();
  }

  void setupCubits() {
    _homecubit = HomeCubit(
      movieService: MovieService(networkManager: ProductNetworkManage()),
    );
    _favoriteCubit = FavoriteCubit(
      movieService: MovieService(networkManager: ProductNetworkManage()),
    );
  }

  Future<void> fetchImages() async {
    await _homecubit.getMovieImages(_movie.id.toString());
  }

  void addToFavorite(FavoriteRequest favoriteMovie) {}
}
