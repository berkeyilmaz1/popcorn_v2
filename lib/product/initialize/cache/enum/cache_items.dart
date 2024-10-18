import 'package:popcorn_v2/product/initialize/cache/auth_cache.dart';

enum CacheItems {
  token;

  String get read => AuthCache.instance.sharedPreferences.getString(name) ?? '';

  Future<bool> write(String value) =>
      AuthCache.instance.sharedPreferences.setString(name, value);

  Future<bool> delete() => AuthCache.instance.sharedPreferences.remove(name);
}
