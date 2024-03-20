import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<String?> getString(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setString(key, value);
  }
}
