import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/home/cubit/home_cubit.dart';
import 'package:popcorn_v2/features/movie_detail/view/movie_detail_view.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';

mixin MovieDetailViewMixin on State<MovieDetailView> {
  late final Movie _movie;
  Movie get movie => _movie;

  late final HomeCubit _homecubit;
  HomeCubit get homeCubit => _homecubit;

  @override
  void initState() {
    super.initState();
    _movie = widget.movie;
    _homecubit = widget.homeCubit;
  }

  Future<void> fetchImages() async {
    await _homecubit.getMovieImages(_movie.id.toString());
  }
}
