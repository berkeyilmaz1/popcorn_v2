import 'dart:io';
 
import 'package:popcorn_v2/core/service/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManage extends NetworkManager<BaseErrorModel> {
  ProductNetworkManage()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            baseUrl: _baseUrl,
            contentType: _contentType,
            // this validation was added due to redirection(302) status e.g.
            validateStatus: (status) {
              return (status ?? 0) < HttpStatus.permanentRedirect;
            },
          ),
        );
  static const String _baseUrl = 'https://api.themoviedb.org/3/';
  //contentType will be changed according to the environment
  static const String _contentType = 'application/json';
}
