import 'package:shared_preferences/shared_preferences.dart';

final class CacheSetup {
  CacheSetup._();
  static CacheSetup instance = CacheSetup._();

  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;
}
