import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_service.dart';

/// Preferences storage implementation using SharedPreferences
/// Use this for non-sensitive data like user settings, app state, etc.
class PreferencesStorageService implements StorageService {
  SharedPreferences? _preferences;

  Future<SharedPreferences> get _prefs async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  @override
  Future<void> write(String key, String value) async {
    log('Storing preference for key: $key', name: 'PreferencesStorageService');
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  @override
  Future<String?> read(String key) async {
    log('Reading preference for key: $key', name: 'PreferencesStorageService');
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    log('Deleting preference for key: $key', name: 'PreferencesStorageService');
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    log('Clearing all preferences', name: 'PreferencesStorageService');
    final prefs = await _prefs;
    await prefs.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final prefs = await _prefs;
    final isContains = prefs.containsKey(key);
    log("Preferences Storage ${isContains ? 'contains' : 'does\'nt contain'} $key");
    return isContains;
  }

  /// Additional convenience methods for SharedPreferences-specific types

  Future<void> writeInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  Future<int?> readInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<void> writeBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  Future<bool?> readBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> writeDouble(String key, double value) async {
    final prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  Future<double?> readDouble(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(key);
  }

  Future<void> writeStringList(String key, List<String> value) async {
    final prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> readStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key);
  }
}
