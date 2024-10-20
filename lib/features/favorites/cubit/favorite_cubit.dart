import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_state.dart';
import 'package:popcorn_v2/product/initialize/cache/enum/cache_items.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/favorite_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/watchlist_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

abstract class IFavoriteCubit {
  Future<void> getFavoriteMovies();
  Future<void> writeFavoriteMovieIdsToCache(List<Movie> favoriteMovies);
  Future<List<String>> readFavoriteMoviesFromCache();
  Future<void> favoriteLogics(FavoriteRequest movie);
  Future<void> watchlistLogics(WatchlistRequest movie);
}

final class FavoriteCubit extends Cubit<FavoriteState>
    implements IFavoriteCubit {
  FavoriteCubit({
    required IMovieService movieService,
  })  : _movieService = movieService,
        super(const FavoriteState());

  final IMovieService _movieService;

  @override
  Future<void> getFavoriteMovies() async {
    _changeLoading(true);
    final response = await _movieService.getFavoriteMovies();
    if (response == null) return;
    await writeFavoriteMovieIdsToCache(response);
    _changeLoading(false);
    emit(state.copyWith(favoriteMovies: response));
  }

  @override
  Future<void> writeFavoriteMovieIdsToCache(List<Movie> favoriteMovies) async {
    final favoriteMoviesIdList = favoriteMovies
        .map(
          (movie) => movie.id.toString(),
        )
        .toList();

    await CacheItems.favorite.writeStringList(favoriteMoviesIdList);
  }

  @override
  Future<List<String>> readFavoriteMoviesFromCache() async {
    final favoriteMovieIdList = CacheItems.favorite.readStringList;

    if (favoriteMovieIdList == null) return [];
    return favoriteMovieIdList;
  }

  @override
  Future<void> favoriteLogics(FavoriteRequest movie) async {
    await _movieService.addToFavorite(movie);
  }

  @override
  Future<void> watchlistLogics(WatchlistRequest movie) async {
    await _movieService.addToWatchlist(movie);
  }

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
