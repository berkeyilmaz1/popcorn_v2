import 'package:shared_preferences/shared_preferences.dart';

final class OnboardManager {
  static const String _onboardKey = 'onboard_complete';

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardKey, true);
  }

  Future<bool> isOnboardCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardKey) ?? false;
  }
}
