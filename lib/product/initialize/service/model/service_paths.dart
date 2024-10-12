final class ServicePaths {
  ServicePaths._();

  ///TODO REMOVE APIKEY
  static const apiKey = '9951b759a9637d2c0390dba63a92e874';

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

  ///MARK: - Movie Images
  static String movieImagesPath(String movieId) {
    return '$movieId/images?api_key=$apiKey';
  }
}
