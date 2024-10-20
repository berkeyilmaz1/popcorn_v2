import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_state.dart';
import 'package:popcorn_v2/product/initialize/cache/enum/cache_items.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

final class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({
    required IMovieService movieService,
  })  : _movieService = movieService,
        super(const FavoriteState());

  final IMovieService _movieService;

  Future<void> getFavoriteMovies() async {
    _changeLoading(true);
    final response = await _movieService.getFavoriteMovies();
    if (response == null) return;
    await writeFavoriteMovieIdsToCache(response);
    _changeLoading(false);
    emit(state.copyWith(favoriteMovies: response));
  }

  Future<void> writeFavoriteMovieIdsToCache(List<Movie> favoriteMovies) async {
    final favoriteMoviesIdList = favoriteMovies
        .map(
          (movie) => movie.id.toString(),
        )
        .toList();
   
    await CacheItems.favorite.writeStringList(favoriteMoviesIdList);
  }

  Future<List<String>> readFavoriteMoviesFromCache() async {
    final favoriteMovieIdList = CacheItems.favorite.readStringList;

    if (favoriteMovieIdList == null) return [];
    return favoriteMovieIdList;
  }

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
