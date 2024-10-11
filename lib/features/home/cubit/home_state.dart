import 'package:equatable/equatable.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_detail_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/videos_model.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
    this.popularMovies,
    this.topRatedMovies,
    this.upcomingMovies,
    this.nowPlayingMovies,
    this.movieDetail,
    this.movieVideos,
  });

  final bool isLoading;
  final List<Movie>? popularMovies;
  final List<Movie>? topRatedMovies;
  final List<Movie>? upcomingMovies;
  final List<Movie>? nowPlayingMovies;
  final MovieDetail? movieDetail;
  final List<Videos>? movieVideos;

  @override
  List<Object?> get props => [
        isLoading,
        popularMovies,
        topRatedMovies,
        upcomingMovies,
        nowPlayingMovies,
      ];

  HomeState copyWith({
    bool? isLoading,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    List<Movie>? nowPlayingMovies,
    MovieDetail? movieDetail,
    List<Videos>? movieVideos,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      movieDetail: movieDetail ?? this.movieDetail,
      movieVideos: movieVideos ?? this.movieVideos,
    );
  }
}
