import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/features/authentication/auth_home/view/auth_view.dart';
import 'package:popcorn_v2/features/authentication/log_in/view/log_in_view.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/sign_up_view.dart';
import 'package:popcorn_v2/features/authentication/sign_up/view/verification_view.dart';
import 'package:popcorn_v2/features/home/tab/tab_view.dart';
import 'package:popcorn_v2/features/movie_detail/view/movie_detail_view.dart';
import 'package:popcorn_v2/features/onboarding/view/onboard_view.dart';
import 'package:popcorn_v2/features/splash/view/splash_view.dart';
import 'package:popcorn_v2/product/initialize/service/model/movie_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: OnboardRoute.page),
        AutoRoute(page: TabRoute.page),
        AutoRoute(page: LogInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(
          page: MovieDetailRoute.page,
        ),
      ];
}
