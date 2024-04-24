import 'package:your_app_test/src/app/app_export.dart';

class SharedPreferencesUtil {
  final FlutterSecureStorage secureStorage;
  final Logger logger;

  SharedPreferencesUtil({
    required this.secureStorage,
    required this.logger,
  });

  Future<void> setString(String? key, String? value) async {
    await secureStorage.write(key: key!, value: value!);
  }

  Future<String?> getString(String? key) async {
    return await secureStorage.read(key: key!);
  }

  Future<void> setInt(String? key, int? value) async {
    await secureStorage.write(key: key!, value: value.toString());
  }

  Future<int?> getInt(String key) async {
    String? value = await secureStorage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  Future<void> setDouble(String key, double value) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  Future<double?> getDouble(String key) async {
    String? value = await secureStorage.read(key: key);
    return value != null ? double.tryParse(value) : null;
  }

  Future<void> setBool(String? key, {bool? value}) async {
    await secureStorage.write(key: key!, value: value.toString());
  }

  Future<bool?> getBool(String key) async {
    String? value = await secureStorage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  Future<bool> removeValue(String key) async {
    try {
      await secureStorage.delete(key: key);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<bool> isExist(String? key) async {
    try {
      String? value = await secureStorage.read(key: key!);
      return value != null;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<void> setStringListPrefs(String key, List<String>? value) async {
    await secureStorage.write(key: key, value: value!.join(','));
  }

  Future<List<String>?> getStringListPrefs(String key) async {
    String? value = await secureStorage.read(key: key);
    return value?.split(',');
  }

  Future<String> getUserId() async {
    try {
      return await secureStorage.read(key: SharedPreferenceConstants.userId) ??
          '';
    } catch (e) {
      logger.e(e);
      return '';
    }
  }

  Future<void> setUserId(userId) async {
    try {
      await secureStorage.write(
          key: SharedPreferenceConstants.userId, value: userId.toString());
    } catch (e) {
      logger.e(e);
    }
  }

  Future<bool> clearSharedPreference() async {
    try {
      await secureStorage.deleteAll();
      return true;
    } catch (e) {
      logger.e(e);
      return true; // session does not exist in the shared-preferences
    }
  }
}
