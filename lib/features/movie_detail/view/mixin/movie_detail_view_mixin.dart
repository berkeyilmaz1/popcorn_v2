import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_cubit.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/movie_detail/view/movie_detail_view.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/favorite_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';
import 'package:popcorn_v2/product/utils/constants/product_constants.dart';

mixin MovieDetailViewMixin on State<MovieDetailView> {
  late final Movie _movie;
  Movie get movie => _movie;

  late final HomeCubit _homecubit;
  HomeCubit get homecubit => _homecubit;

  late final FavoriteCubit _favoriteCubit;
  FavoriteCubit get favoriteCubit => _favoriteCubit;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    setupCubits();
    fetchImages();
    getMoviesAndCheckFavorite();
  }

  Future<void> getMoviesAndCheckFavorite() async {
    await getFavoriteMovies();
    await checkIsFavorite(_movie.id);
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

  FavoriteRequest get favoriteRequest => FavoriteRequest(
        mediaType: ProductConstants.movie,
        mediaId: _movie.id,
        favorite: !isLiked,
      );

  Future<void> favoriteLogics() async {
    await _favoriteCubit.favoriteLogics(favoriteRequest);
    setState(() {
      isLiked = !isLiked;
    });
  }

  Future<void> getFavoriteMovies() async {
    final movies = await _favoriteCubit.readFavoriteMoviesFromCache();
    if (movies.isEmpty) await _favoriteCubit.getFavoriteMovies();
  }

  Future<void> checkIsFavorite(int? movieId) async {
    final movies = await _favoriteCubit.readFavoriteMoviesFromCache();
    if (movieId == null) return;

    final result = movies.contains(movieId.toString());
    setState(() {
      isLiked = result;
    });
  }
}
