import 'package:popcorn_v2/product/initialize/config/app_environment.dart';

final class ServicePaths {
  ServicePaths._();

  static final apiKey = AppEnvironmentItems.apiKey.value;
  static const accountId = 'XXX';
  static const sessionId = 'XXX';

  ///MARK: - Movie Paths
  static final popularMoviesPath = 'movie/popular?api_key=$apiKey';
  static final topRatedMoviesPath = 'movie/top_rated?api_key=$apiKey';
  static final upcomingMoviesPath = 'movie/upcoming?api_key=$apiKey';
  static final nowPlayingMoviesPath = 'movie/now_playing?api_key=$apiKey';

  ///MARK: - Movie Details
  static String movieDetailsPath(String movieId) {
    return 'movie/$movieId?api_key=$apiKey';
  }

  ///MARK: - Movie Videos
  static String movieVideosPath(String movieId) {
    return 'movie/$movieId/videos?api_key=$apiKey';
  }

  ///MARK: - Movie Images
  static String movieImagesPath(String movieId) {
    return 'movie/$movieId/images?api_key=$apiKey';
  }

  ///MARK: - Image Paths
  static String posterPath(String imageUrl) {
    return 'https://image.tmdb.org/t/p/w500$imageUrl';
  }

  ///Mark: Favorite and Watchlist Paths
  static final allFavoritesPath =
      'account/$accountId/favorite/movies?api_key=$apiKey&session_id=$sessionId';
  static final allWatchlistPath =
      'account/$accountId/watchlist/movies?api_key=$apiKey&session_id=$sessionId';

  static final addToFavoritePath =
      'account/$accountId/favorite?api_key=$apiKey&session_id=$sessionId';

  static final addToWatchlistPath =
      'account/$accountId/watchlist?api_key=$apiKey&session_id=$sessionId';

  static const searchMoviePath = 'search/movie?api_key=$apiKey';
}
