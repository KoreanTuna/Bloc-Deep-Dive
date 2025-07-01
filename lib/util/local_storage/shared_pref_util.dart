import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  @injectable
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@singleton
class SharedPrefUtil {
  SharedPrefUtil({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<void> setString({
    required String key,
    required String value,
  }) async {
    await sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  Future<void> setInt({
    required String key,
    required int value,
  }) async {
    await sharedPreferences.setInt(key, value);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  Future<void> setDouble({
    required String key,
    required double value,
  }) async {
    await sharedPreferences.setDouble(key, value);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) async {
    await sharedPreferences.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }

  Set<String> getKeys() {
    return sharedPreferences.getKeys();
  }

  Future<void> reload() async {
    await sharedPreferences.reload();
  }
}
