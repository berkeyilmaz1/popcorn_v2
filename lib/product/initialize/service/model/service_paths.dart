final class ServicePaths {
  ServicePaths._();

  ///TODO REMOVE APIKEY
  static const apiKey = 'apikey';

  ///MARK: - Movie Paths
  static const popularMoviesPath = 'popular?api_key=$apiKey';
  static const topRatedMoviesPath = 'top_rated?api_key=$apiKey';
  static const upcomingMoviesPath = 'upcoming?api_key=$apiKey';
  static const nowPlayingMoviesPath = 'now_playing?api_key=$apiKey';
}
