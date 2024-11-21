final class ServicePaths {
  ServicePaths._();

  static const moviePrefix = 'movie';
  static const accountPrefix = 'account';

  ///todo implement account - session logic.
  static const accountId = 'XXX';
  static const sessionId = 'XXX';

  ///MARK: - Movie Paths
  static const popularMoviesPath = '$moviePrefix/popular';
  static const topRatedMoviesPath = '$moviePrefix/top_rated';
  static const upcomingMoviesPath = '$moviePrefix/upcoming';
  static const nowPlayingMoviesPath = '$moviePrefix/now_playing';
  static String castPath(String movieId) {
    return '$moviePrefix/$movieId/credits';
  }

  ///MARK: - Movie Details
  static String movieDetailsPath(String movieId) {
    return '$moviePrefix/$movieId';
  }

  ///MARK: - Movie Videos
  static String movieVideosPath(String movieId) {
    return '$moviePrefix/$movieId/videos';
  }

  ///MARK: - Movie Images
  static String movieImagesPath(String movieId) {
    return '$moviePrefix/$movieId/images';
  }

  ///MARK: - Image Paths
  static String posterPath(String imageUrl) {
    return 'https://image.tmdb.org/t/p/w500$imageUrl';
  }

  ///Mark: Favorite and Watchlist Paths
  static const allFavoritesPath = '$accountPrefix/$accountId/favorite/movies';
  static const allWatchlistPath = '$accountPrefix/$accountId/watchlist/movies';
  static const addToFavoritePath = '$accountPrefix/$accountId/favorite';
  static const addToWatchlistPath = '$accountPrefix/$accountId/watchlist';

  static const searchMoviePath = 'search/movie';
}
