import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/favorite_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/account/watchlist_request_model.dart';
import 'package:popcorn_v2/product/initialize/service/movie_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final NetworkManager<BaseErrorModel> networkManager =
      ProductNetworkManage();

  late final IMovieService movieService =
      MovieService(networkManager: networkManager);

  group('Movie Lists Test', () {
    test('Get All Favorites', () async {
      final response = await movieService.getFavoriteMovies();
      expect(response, isNotNull);
    });

    test('Get All Watchlist', () async {
      final response = await movieService.getWatchlistMovies();
      expect(response, isNotNull);
    });

    test('Add To Favorite', () async {
      final response = await movieService.addToFavorite(
        FavoriteRequest(favorite: true, mediaType: 'movie', mediaId: 600),
      );
      expect(response, isNotNull);
    });

    test('Add To Watchlist', () async {
      final response = await movieService.addToWatchlist(
          WatchlistRequest(mediaId: 600, watchlist: true, mediaType: 'movie'));
      expect(response, isNotNull);
    });
  });
}
