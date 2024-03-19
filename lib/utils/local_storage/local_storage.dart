library local_storage;

import 'dart:convert';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

part 'hive_box.dart';
part 'hive_keys.dart';

class LocalStorage {
  LocalStorage._();
  static final LocalStorage _instance = LocalStorage._();
  static LocalStorage get instance => _instance;

  // Initialize Hive
  Future<void> initHive() async {
    String? directoryPath;
    if (Platform.isIOS) {
      final directory = await path.getApplicationSupportDirectory();
      directoryPath = directory.path;
    }
    await Hive.initFlutter(directoryPath);
  }

  /// Close the box
  Future<void> closeBox<T>(String boxName) async {
    final box = await _getBoxByName(boxName);
    await box!.close();
  }

  // Write data to a box
  Future<void> writeData<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    final box = await _getBoxByName(boxName);
    String encodedValue = json.encode(value);
    await box!.put(key, encodedValue);
  }

  // Read data from a box
  Future<T?> readData<T>({
    required String boxName,
    required String key,
  }) async {
    final box = await _getBoxByName(boxName);
    final encodedString = await box!.get(key);
    if (encodedString != null) {
      T? decodedData = json.decode(encodedString);
      return decodedData;
    } else {
      return null;
    }
  }

  // Delete data from a box
  Future<void> deleteData<T>({
    required String boxName,
    String? key,
  }) async {
    final box = await _getBoxByName(boxName);
    if (key != null) {
      await box!.delete(key);
    } else {
      await box!.clear();
    }
  }

  /// get box by name
  Future<Box<T>?> _getBoxByName<T>(String boxName) async {
    final box = await Hive.openBox<T>(boxName);
    return box;
  }
}
