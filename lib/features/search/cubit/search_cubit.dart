import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/search/cubit/search_state.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

final class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required IMovieService movieService,
  })  : _movieService = movieService,
        super(const SearchState());

  final IMovieService _movieService;

  Future<void> searchMovies(String query) async {
    _changeLoading(true);
    final response = await _movieService.searchMovie(query);
    _changeLoading(false);
    emit(state.copyWith(searchedMovies: response));
  }

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
