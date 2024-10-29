import 'package:popcorn_v2/product/initialize/config/app_environment.dart';

final class ServicePaths {
  ServicePaths._();

  static const moviePrefix = 'movie';
  static const accountPrefix = 'account';

  static final apiKey = AppEnvironmentItems.apiKey.value;
  static const accountId = 'XXX';
  static const sessionId = 'XXX';

  ///MARK: - Movie Paths
  static final popularMoviesPath = '$moviePrefix/popular?api_key=$apiKey';
  static final topRatedMoviesPath = '$moviePrefix/top_rated?api_key=$apiKey';
  static final upcomingMoviesPath = '$moviePrefix/upcoming?api_key=$apiKey';
  static final nowPlayingMoviesPath =
      '$moviePrefix/now_playing?api_key=$apiKey';
  static String castPath(String movieId) {
    return '$moviePrefix/$movieId/credits?api_key=$apiKey';
  }

  ///MARK: - Movie Details
  static String movieDetailsPath(String movieId) {
    return '$moviePrefix/$movieId?api_key=$apiKey';
  }

  ///MARK: - Movie Videos
  static String movieVideosPath(String movieId) {
    return '$moviePrefix/$movieId/videos?api_key=$apiKey';
  }

  ///MARK: - Movie Images
  static String movieImagesPath(String movieId) {
    return '$moviePrefix/$movieId/images?api_key=$apiKey';
  }

  ///MARK: - Image Paths
  static String posterPath(String imageUrl) {
    return 'https://image.tmdb.org/t/p/w500$imageUrl';
  }

  ///Mark: Favorite and Watchlist Paths
  ///TODO: ACCOUNT ID AND SESSION ID
  static final allFavoritesPath =
      '$accountPrefix/$accountId/favorite/movies?api_key=$apiKey&session_id=$sessionId';
  static final allWatchlistPath =
      '$accountPrefix/$accountId/watchlist/movies?api_key=$apiKey&session_id=$sessionId';
  static final addToFavoritePath =
      '$accountPrefix/$accountId/favorite?api_key=$apiKey&session_id=$sessionId';
  static final addToWatchlistPath =
      '$accountPrefix/$accountId/watchlist?api_key=$apiKey&session_id=$sessionId';

  static final searchMoviePath = 'search/movie?api_key=$apiKey';
}
