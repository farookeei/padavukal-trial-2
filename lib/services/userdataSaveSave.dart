import 'sharedPrefencesConfig.dart';

class UserDatabasesave extends SharedPreferenceConfig {
  String _userkey = 'userData';

  Future<void> userWritedata({
    String userName,
    String email,
    String token,
    String name,
    int id,
  }) async {
    Map _data = {
      'userName': userName,
      "email": email,
      "token": token,
      "name": name,
      "id": id
    };

    await saveData(dataBody: _data, key: _userkey);
  }

  Future<Map> userReadData() async {
    try {
      final Map _userData = await readData(key: _userkey);
      return _userData;
    } catch (e) {
      throw e;
    }
  }
}
