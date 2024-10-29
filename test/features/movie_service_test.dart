import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';
import 'package:popcorn_v2/product/initialize/config/app_environment.dart';
import 'package:popcorn_v2/product/initialize/config/env.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final IMovieService movieService;
  setUp(() {
    final NetworkManager<BaseErrorModel> networkManager =
        ProductNetworkManage();

    movieService = MovieService(networkManager: networkManager);
    AppEnvironment.setup(Env());
  });

  group('Movie Lists Test', () {
    test('Get Popular Movies', () async {
      final response = await movieService.getPopularMovies();
      expect(response, isNotNull);
    });

    test('Get Top Rated Movies', () async {
      final response = await movieService.getTopRatedMovies();
      expect(response, isNotNull);
    });

    test('Get upcoming Movies', () async {
      final response = await movieService.getUpcomingMovies();
      expect(response, isNotNull);
    });

    test('Get Now Playing Movies', () async {
      final response = await movieService.getNowPlayingMovies();
      expect(response, isNotNull);
    });
  });

  const movieId = '533535';

  test('Get Cast', () async {
    final response = await movieService.getMovieCast(movieId);
    expect(response, isNotNull);
  });

  test('Get Movie Detail', () async {
    final response = await movieService.getMovieDetail(movieId);
    expect(response, isNotNull);
  });

  test('Get Movie Videos', () async {
    final response = await movieService.getMovieVideos(movieId);
    expect(response, isNotNull);
  });

  test('Get Movie Images', () async {
    final response = await movieService.getMovieImages(movieId);
    expect(response, isNotNull);
  });
}
