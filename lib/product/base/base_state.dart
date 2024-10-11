import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/service/product_network_manager.dart';

mixin BaseState<T extends StatefulWidget> on State<T> {
  final networkManager = ProductNetworkManage();
}
