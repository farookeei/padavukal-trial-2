import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:padavukal/providers/models/exception/databaseException.dart';

import 'package:padavukal/services/dataBaseConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceConfig extends DataBaseConfig {
  @override
  Future<Map> readData({String key}) async {
    try {
      if (key == null) {
        throw DatabaseException('key is Empty');
      }
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      if (!_prefs.containsKey(key)) {
        throw DatabaseException('Database doesnt contain this key');
      }
      String _tempData = _prefs.getString(key);
      Map decodeData = json.decode(_tempData);
      return decodeData;
    } catch (error) {
      throw error;
    }
  }

  Future<bool> saveData({@required Map dataBody, @required String key}) async {
    final _encodeData = json.encode(dataBody);
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool _result = await _prefs.setString(key, _encodeData);
      return _result;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map> writeData({String key, Map writeMap}) {
    // TODO: implement writeData
    throw UnimplementedError();
  }
}
