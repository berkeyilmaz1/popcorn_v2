final class ServicePaths {
  ServicePaths._();

  ///TODO REMOVE APIKEY
  static const apiKey = 'XXX';
  static const accountId = 'XXX';
  static const sessionId = 'XXX';

  ///MARK: - Movie Paths
  static const popularMoviesPath = 'movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = 'movie/top_rated?api_key=$apiKey';
  static const upcomingMoviesPath = 'movie/upcoming?api_key=$apiKey';
  static const nowPlayingMoviesPath = 'movie/now_playing?api_key=$apiKey';

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
  static const allFavoritesPath =
      'account/$accountId/favorite/movies?api_key=$apiKey&session_id=$sessionId';
  static const allWatchlistPath =
      'account/$accountId/watchlist/movies?api_key=$apiKey&session_id=$sessionId';
}
