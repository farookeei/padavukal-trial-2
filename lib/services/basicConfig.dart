import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:padavukal/providers/models/exception/httpException.dart';

String baseURL = 'http://13.234.117.161:8000';

abstract class BaseConfigAPI {
  String baseURL = 'http://13.234.117.161:8000';

  dynamic _convertFetchData({@required http.Response data}) {
    final _decodeData = json.decode(data.body);
    print(_decodeData);
    dynamic _result;
    if (_decodeData is Map) {
      if (_decodeData.containsKey('results')) {
        _result = _decodeData['results'];
      } else {
        _result = _decodeData;
      }
    } else {
      _result = _decodeData;
    }
    return _result;
  }

  Future<dynamic> getAPI({@required String url, String token}) async {
    try {
      url = baseURL + url;
      // * this is make to String key and value because header need string value
      Map<String, String> headers = {'Content-Type': 'application/json'};
      if (token != null) {
        headers = {
          'Content-Type': 'application/json',
          'Authorization': 'token $token'
        };
      }
      final _fetchData = await http.get(url, headers: headers);
      return _convertFetchData(data: _fetchData);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> postAPI({@required String url, @required Map body}) async {
    url = baseURL + url;
    print("$url");
    final _encodeData = json.encode(body);
    print("$_encodeData");
    try {
      final _fetchData = await http.post(url,
          body: _encodeData, headers: {'Content-Type': 'application/json'});
      print(_fetchData.body);
      if (_fetchData.statusCode < 200 || _fetchData.statusCode > 226) {
        print(_fetchData.statusCode);
        throw HttpException('Error occured', _fetchData.statusCode);
      }
      return _convertFetchData(data: _fetchData);
    } catch (e) {
      throw e;
    }
  }
}
