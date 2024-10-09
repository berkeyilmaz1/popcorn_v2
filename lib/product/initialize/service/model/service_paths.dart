final class ServicePaths {
  ServicePaths._();

  ///TODO REMOVE APIKEY
  static const apiKey = 'apiKey';

  ///MARK: - Movie Paths
  static const popularMoviesPath = 'popular?api_key=$apiKey';
  static const topRatedMoviesPath = 'top_rated?api_key=$apiKey';
  static const upcomingMoviesPath = 'upcoming?api_key=$apiKey';
  static const nowPlayingMoviesPath = 'now_playing?api_key=$apiKey';

  ///MARK: - Movie Details
  static String movieDetailsPath(String movieId) {
    return '$movieId?api_key=$apiKey';
  }

  ///MARK: - Movie Videos
  static String movieVideosPath(String movieId) {
    return '$movieId/videos?api_key=$apiKey';
  }
}
