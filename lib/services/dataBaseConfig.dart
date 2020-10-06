import 'package:flutter/cupertino.dart';

abstract class DataBaseConfig {
  Future<Map> readData({@required String key});
  Future<Map> writeData({@required String key, @required Map writeMap});
}
