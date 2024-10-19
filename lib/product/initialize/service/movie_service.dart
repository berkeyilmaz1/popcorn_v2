import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/favorite_and_watchlist_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_detail_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_images_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_lists_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/service/model/trailer_and_videos_model.dart';
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
  Future<MovieDetail?> getMovieDetail(String movieId);
  // Future<List<Cast>?> getMovieCast(String movieId);
  Future<List<Videos>?> getMovieVideos(String movieId);
  Future<List<MovieImages>?> getMovieImages(String movieId);
  Future<List<Movie>?> getFavoriteMovies();
  Future<List<Movie>?> getWatchlistMovies();
}

final class MovieService extends IMovieService {
  MovieService({required super.networkManager});

  @override
  Future<MovieDetail?> getMovieDetail(String movieId) async {
    final response = await _networkManager.send<MovieDetail, MovieDetail>(
      ServicePaths.movieDetailsPath(movieId),
      parseModel: MovieDetail(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<List<Videos>?> getMovieVideos(String movieId) async {
    final response =
        await _networkManager.send<TrailerAndVideos, TrailerAndVideos>(
      ServicePaths.movieVideosPath(movieId),
      parseModel: TrailerAndVideos(),
      method: RequestType.GET,
    );
    return response.data?.results;
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

  @override
  Future<List<MovieImages>?> getMovieImages(String movieId) async {
    final response =
        await _networkManager.send<MovieImagesList, MovieImagesList>(
      ServicePaths.movieImagesPath(movieId),
      parseModel: MovieImagesList(),
      method: RequestType.GET,
    );
    return response.data?.backdrops;
  }

  @override
  Future<List<Movie>?> getFavoriteMovies() async {
    final response =
        await _networkManager.send<FavoriteAndWatchlist, FavoriteAndWatchlist>(
      ServicePaths.allFavoritesPath,
      parseModel: FavoriteAndWatchlist(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }

  @override
  Future<List<Movie>?> getWatchlistMovies() async {
     final response =
        await _networkManager.send<FavoriteAndWatchlist, FavoriteAndWatchlist>(
      ServicePaths.allWatchlistPath,
      parseModel: FavoriteAndWatchlist(),
      method: RequestType.GET,
    );
    return response.data?.results;
  }
}
