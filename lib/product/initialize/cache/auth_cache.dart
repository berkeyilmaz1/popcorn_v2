import 'package:shared_preferences/shared_preferences.dart';

final class AuthCache {
  AuthCache._();
  static AuthCache instance = AuthCache._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;
}
