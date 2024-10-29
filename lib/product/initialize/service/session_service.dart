import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/service_paths.dart';
import 'package:popcorn_v2/product/initialize/service/model/session/request_token_model.dart';
import 'package:popcorn_v2/product/initialize/service/model/session/session_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISessionService {
  ISessionService({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  final INetworkManager<BaseErrorModel> _networkManager;

  Future<RequestToken?> createRequestToken();
  Future<SessionResponse?> createSession(String sessionRequest);
}

final class SessionService extends ISessionService {
  SessionService({required super.networkManager});

  @override
  Future<RequestToken?> createRequestToken() async {
    final response = await _networkManager.send<RequestToken, RequestToken>(
      ServicePaths.requestTokenPath,
      parseModel: RequestToken(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<SessionResponse?> createSession(String sessionRequest) async {
    final response =
        await _networkManager.send<SessionResponse, SessionResponse>(
      ServicePaths.createSessionPath,
      parseModel: SessionResponse(),
      method: RequestType.POST,
      data: sessionRequest,
    );
    return response.data;
  }
}
