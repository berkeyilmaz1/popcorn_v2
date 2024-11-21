import 'dart:io';

import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:popcorn_v2/product/initialize/config/app_environment.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManage extends NetworkManager<BaseErrorModel> {
  ProductNetworkManage()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: _baseUrl,
            contentType: _contentType,
            queryParameters: {
              _apiKey: apiKey,
            },
            validateStatus: (status) {
              return (status ?? 0) < HttpStatus.permanentRedirect;
            },
          ),
        );
  static const String _baseUrl = 'https://api.themoviedb.org/3/';
  static const String _contentType = 'application/json';
  static const String _apiKey = 'api_key';
  static final apiKey = AppEnvironmentItems.apiKey.value;
}
