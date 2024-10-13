import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn_v2/features/home/cubit/home_state.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

abstract class IHomeCubit {
  Future<void> getPopularMovies();
  Future<void> getTopRatedMovies();
  Future<void> getUpcomingMovies();
  Future<void> getNowPlayingMovies();
  Future<void> getMovieDetail(String movieId);
  Future<void> getMovieVideos(String movieId);
  Future<void> getMovieImages(String movieId);
}

final class HomeCubit extends Cubit<HomeState> implements IHomeCubit {
  HomeCubit({
    required IMovieService movieService,
  })  : _movieService = movieService,
        super(const HomeState());

  final IMovieService _movieService;
  @override
  Future<void> getMovieDetail(String movieId) async {
    _changeLoading(true);
    final response = await _movieService.getMovieDetail(movieId);
    _changeLoading(false);
    emit(state.copyWith(movieDetail: response));
  }

  @override
  Future<void> getMovieVideos(String movieId) async {
    _changeLoading(true);
    final response = await _movieService.getMovieVideos(movieId);
    _changeLoading(false);
    emit(state.copyWith(movieVideos: response));
  }

  @override
  Future<void> getNowPlayingMovies() async {
    _changeLoading(true);
    final response = await _movieService.getNowPlayingMovies();
    _changeLoading(false);
    emit(state.copyWith(nowPlayingMovies: response));
  }

  @override
  Future<void> getPopularMovies() async {
    _changeLoading(true);
    final response = await _movieService.getPopularMovies();
    _changeLoading(false);
    emit(state.copyWith(popularMovies: response));
  }

  @override
  Future<void> getTopRatedMovies() async {
    _changeLoading(true);
    final response = await _movieService.getTopRatedMovies();
    _changeLoading(false);
    emit(state.copyWith(topRatedMovies: response));
  }

  @override
  Future<void> getUpcomingMovies() async {
    _changeLoading(true);
    final response = await _movieService.getUpcomingMovies();
    _changeLoading(false);
    emit(state.copyWith(upcomingMovies: response));
  }

  @override
  Future<void> getMovieImages(String movieId) async {
    _changeLoading(true);
    final response = await _movieService.getMovieImages(movieId);
    _changeLoading(false);
    emit(state.copyWith(movieImages: response));
  }

  void _changeLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
