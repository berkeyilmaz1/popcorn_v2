import 'package:popcorn_v2/product/initialize/cache/cache_setup.dart';

/// Enum for cache items
enum CacheItems {
  token,
  favorite;

  String? get read => CacheSetup.instance.sharedPreferences.getString(name);

  Future<bool> write(String value) =>
      CacheSetup.instance.sharedPreferences.setString(name, value);

  Future<bool> delete() => CacheSetup.instance.sharedPreferences.remove(name);

  Future<bool> writeStringList(List<String> value) =>
      CacheSetup.instance.sharedPreferences.setStringList(name, value);

  List<String>? get readStringList =>
      CacheSetup.instance.sharedPreferences.getStringList(name);

  Future<bool> deleteStringList() =>
      CacheSetup.instance.sharedPreferences.remove(name);
}
