import 'package:flutter/material.dart';
import 'package:popcorn_v2/core/onboard_manager/onboard_manager.dart';
import 'package:popcorn_v2/features/authentication/view/auth_view.dart';
import 'package:popcorn_v2/features/onboarding/view/onboard_view.dart';
import 'package:popcorn_v2/features/splash/view/splash_view.dart';

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
