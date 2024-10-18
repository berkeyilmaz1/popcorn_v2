import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/onboard_manager/onboard_manager.dart';
import 'package:popcorn_v2/features/authentication/auth_home/view/auth_view.dart';
import 'package:popcorn_v2/product/initialize/service/auth_service.dart';
import 'package:popcorn_v2/features/home/tab/tab_view.dart';
import 'package:popcorn_v2/features/onboarding/view/onboard_view.dart';
import 'package:popcorn_v2/features/splash/view/splash_view.dart';

mixin SplashMixin on State<SplashView> {
  late final OnboardManager _onboardManager;
  late final AuthService _authService;
  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _onboardManager = OnboardManager();
    checkOnboard();
    _checkAuthenticationStatus();
  }

  Future<void> _checkAuthenticationStatus() async {
    final isSignedIn = await _authService.isUserSignedIn();

    if (isSignedIn) await _navigateToHome();
    final cachedToken = await _authService.getCachedToken();
    if (cachedToken == null) await _navigateToLogin();
    await _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<AuthView>(
        builder: (context) => const TabView(),
      ),
      (route) => false,
    );
  }

  Future<void> _navigateToLogin() async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<AuthView>(
        builder: (context) => const AuthView(),
      ),
      (route) => false,
    );
  }

  Future<void> checkOnboard() async {
    final isOnboardCompleted = await _onboardManager.isOnboardCompleted();
    if (isOnboardCompleted) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<AuthView>(
          builder: (context) => const AuthView(),
        ),
        (route) => false,
      );
    } else {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<OnboardView>(
          builder: (context) => const OnboardView(),
        ),
        (route) => false,
      );
    }
  }
}
