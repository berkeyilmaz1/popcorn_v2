import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/auth_home/view/auth_view.dart';

mixin AuthViewMixin on State<AuthView> {
  void pushToPages(
    PageRouteInfo<dynamic> route,
  ) {
    context.router.push(route);
  }
}
