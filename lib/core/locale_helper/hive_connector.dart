import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConnector {
  late Box _box;

  HiveConnector(String boxName) {
    _initBox(boxName);
  }

  Future<void> _initBox(String boxName) async {
    try {
      _box = await Hive.openBox(boxName);
    } catch (e) {
      throw Exception("Hive box initialization failed.");
    }
  }

  Future<void> put<T>(String key, T value) async {
    try {
      await _box.put(key, value);
    } catch (e) {
      throw Exception("Failed to save data.:${e.toString()}");
    }
  }

  T? get<T>(String key, {Object? defaultValue}) {
    try {
      final value = _box.get(key);
      if (value == null) {
        return defaultValue as T?;
      }
      return value;
    } catch (e) {
      throw Exception("Failed to retrieve data.");
    }
  }

  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (e) {
      throw Exception("Failed to delete data.");
    }
  }

  List<dynamic> getAllKeys() {
    try {
      final keys = _box.keys.toList();
      return keys;
    } catch (e) {
      throw Exception("Failed to retrieve keys.");
    }
  }

  Future<void> clear() async {
    try {
      await _box.clear();
    } catch (e) {
      throw Exception("Failed to clear data.");
    }
  }

  bool containsKey(String key) {
    try {
      final exists = _box.containsKey(key);
      return exists;
    } catch (e) {
      throw Exception("Failed to check key existence.");
    }
  }

  Future<void> close() async {
    try {
      await _box.close();
    } catch (e) {
      throw Exception("Failed to close the box.");
    }
  }
}
