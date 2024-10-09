import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/cast_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_detail_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_lists_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/service/model/videos_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMovieService {
  IMovieService({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  final INetworkManager<BaseErrorModel> _networkManager;

  Future<List<Movie>?> getPopularMovies();
  Future<List<Movie>?> getTopRatedMovies();
  Future<List<Movie>?> getUpcomingMovies();
  Future<List<Movie>?> getNowPlayingMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Cast>?> getMovieCast(int movieId);
  Future<List<Videos>?> getMovieVideos(int movieId);
}

final class MovieService extends IMovieService {
  MovieService({required super.networkManager});

  @override
  Future<List<Cast>?> getMovieCast(int movieId) {
    // TODO: implement getMovieCast
    throw UnimplementedError();
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<List<Videos>?> getMovieVideos(int movieId) {
    // TODO: implement getMovieVideos
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> getNowPlayingMovies() async {
    final response = await _networkManager.send<MovieLists, MovieLists>(
      ServicePaths.nowPlayingMoviesPath,
      parseModel: MovieLists(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> getPopularMovies() async {
    final response = await _networkManager.send<MovieLists, MovieLists>(
      ServicePaths.popularMoviesPath,
      parseModel: MovieLists(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> getTopRatedMovies() async {
    final response = await _networkManager.send<MovieLists, MovieLists>(
      ServicePaths.topRatedMoviesPath,
      parseModel: MovieLists(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> getUpcomingMovies() async {
    final response = await _networkManager.send<MovieLists, MovieLists>(
      ServicePaths.upcomingMoviesPath,
      parseModel: MovieLists(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }
}
