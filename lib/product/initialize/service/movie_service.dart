import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

abstract class IMovieService {
  IMovieService({
    required INetworkManager<BaseErrorModel> networkManager,
  }) : _networkManager = networkManager;

  final INetworkManager<BaseErrorModel> _networkManager;
  
}
