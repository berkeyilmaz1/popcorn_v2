import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/favorites/cubit/favorite_state.dart';
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
    _changeLoading(false);
    emit(state.copyWith(favoriteMovies: response));
  }

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
