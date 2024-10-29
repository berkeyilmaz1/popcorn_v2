import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/onboard_manager/onboard_manager.dart';
import 'package:popcorn_v2/features/splash/view/splash_view.dart';
import 'package:popcorn_v2/product/initialize/router/app_router.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';

mixin SplashMixin on State<SplashView> {
  late final OnboardManager _onboardManager;
  late final AuthService _authService;
  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _onboardManager = OnboardManager();
    _checkOnboard();
  }

  Future<void> _checkOnboard() async {
    await checkOnboard();
  }

  Future<void> _checkAuthenticationStatus() async {
    final isSignedIn = await _authService.isUserSignedIn();

    if (isSignedIn) {
      await _navigateToHome();
      return;
    }

    final cachedToken = await _authService.getCachedToken();
    if (cachedToken == null) {
      await _navigateToLogin();
      return;
    }

    await _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await context.router.replaceAll([const TabRoute()]);
  }

  Future<void> _navigateToLogin() async {
    await context.router.replaceAll([const AuthRoute()]);
  }

  Future<void> _navigateToOnboard() async {
    await context.router.replaceAll([const OnboardRoute()]);
  }

  Future<void> checkOnboard() async {
    final isOnboardCompleted = await _onboardManager.isOnboardCompleted();
    if (isOnboardCompleted) {
      await _checkAuthenticationStatus();
      return;
    }

    await _navigateToOnboard();
  }
}
