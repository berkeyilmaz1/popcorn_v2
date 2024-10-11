import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/onboard_manager/onboard_manager.dart';
import 'package:popcorn_v2/features/authentication/auth_view.dart';
import 'package:popcorn_v2/features/onboarding/onboard/onboard_view.dart';
import 'package:popcorn_v2/features/splash/splash_view.dart';

mixin SplashMixin on State<SplashView> {
  late final OnboardManager _onboardManager;
  @override
  void initState() {
    super.initState();
    _onboardManager = OnboardManager();
    checkOnboard();
  }

  Future<void> checkOnboard() async {
    final isOnboardCompleted = await _onboardManager.isOnboardCompleted();
    if (isOnboardCompleted) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<AuthView>(
          builder: (context) => const AuthView(),
        ),
      );
    } else {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<OnboardView>(
          builder: (context) => const OnboardView(),
        ),
      );
    }
  }
}
