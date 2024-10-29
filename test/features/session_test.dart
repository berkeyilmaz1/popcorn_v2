import 'package:flutter_test/flutter_test.dart';
import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';
import 'package:popcorn_v2/product/initialize/config/app_environment.dart';
import 'package:popcorn_v2/product/initialize/config/env.dart';
import 'package:popcorn_v2/product/initialize/service/session_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ISessionService sessionService;
  setUp(() {
    final NetworkManager<BaseErrorModel> networkManager =
        ProductNetworkManage();

    sessionService = SessionService(networkManager: networkManager);
    AppEnvironment.setup(Env());
  });

  group(
    'Session',
    () {
      const token = '';
      test('Create request token', () async {
        final response = await sessionService.createRequestToken();
        print('token :${response?.requestToken}');
        expect(response, isNotNull);
      });

      // launchUrl(
      //   Uri.parse('https://www.themoviedb.org/authenticate/$token'),
      // );

      test('Create session', () async {
        final response = await sessionService.createSession(
          token,
        );
        expect(response, isNotNull);
      });
    },
  );
}
