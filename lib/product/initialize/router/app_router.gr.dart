// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthView]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthView();
    },
  );
}

/// generated route for
/// [LogInView]
class LogInRoute extends PageRouteInfo<void> {
  const LogInRoute({List<PageRouteInfo>? children})
      : super(
          LogInRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogInView();
    },
  );
}

/// generated route for
/// [MovieDetailView]
class MovieDetailRoute extends PageRouteInfo<MovieDetailRouteArgs> {
  MovieDetailRoute({
    required Movie movie,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailRoute.name,
          args: MovieDetailRouteArgs(
            movie: movie,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailRouteArgs>();
      return MovieDetailView(
        movie: args.movie,
        key: args.key,
      );
    },
  );
}

class MovieDetailRouteArgs {
  const MovieDetailRouteArgs({
    required this.movie,
    this.key,
  });

  final Movie movie;

  final Key? key;

  @override
  String toString() {
    return 'MovieDetailRouteArgs{movie: $movie, key: $key}';
  }
}

/// generated route for
/// [OnboardView]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardView();
    },
  );
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordView();
    },
  );
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpView();
    },
  );
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashView();
    },
  );
}

/// generated route for
/// [TabView]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
      : super(
          TabRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TabView();
    },
  );
}

/// generated route for
/// [VerificationView]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute({List<PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VerificationView();
    },
  );
}
