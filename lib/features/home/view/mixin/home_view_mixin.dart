import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/home/view/home_view.dart';
import 'package:popcorn_v2/product/base/base_state.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';

mixin HomeViewMixin on State<HomeView>, BaseState<HomeView> {
  late final HomeCubit _homeCubit;
  HomeCubit get homeCubit => _homeCubit;
  @override
  void initState() {
    super.initState();

    setupCubit();
    fetchMovies();
  }

  void setupCubit() {
    _homeCubit =
        HomeCubit(movieService: MovieService(networkManager: networkManager));
  }

  Future<void> fetchMovies() async {
    await _homeCubit.getPopularMovies();
    await _homeCubit.getTopRatedMovies();
    await _homeCubit.getUpcomingMovies();
    await _homeCubit.getNowPlayingMovies();
    
  }
}
