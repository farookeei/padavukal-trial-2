import 'package:flutter/cupertino.dart';
import 'package:padavukal/services/userdataSaveSave.dart';
import '../services/basicConfig.dart';
import 'models/user_model.dart.dart';

class UserProvider extends BaseConfigAPI with ChangeNotifier {
  User currentUser = new User();

  Future<List> login({Map body}) async {
    try {
      final data = await postAPI(
        url: '/api/login/',
        body: body,
      );
      currentUser.setUserData(data);
      notifyListeners();
      print("Data : $data");
      User user = User.fromJson(data);

      UserDatabasesave _userdatabseSave = UserDatabasesave();
      _userdatabseSave.userWritedata(
          email: currentUser.email,
          name: currentUser.name,
          userName: currentUser.username,
          token: currentUser.token,
          id: currentUser.id);

      print(user.token);
      return [data];
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List> signUp({Map body}) async {
    try {
      dynamic data = await postAPI(
        url: '/api/user/',
        body: body,
      );
      currentUser.setUserData(data);
      notifyListeners();

      return [data];
    } catch (e) {
      print("error in signup() $e");
      print(e);
      throw e;
    }
  }

  Future<bool> checkCurrentUser() async {
    UserDatabasesave _userDatabasesave = UserDatabasesave();

    final _userData = await _userDatabasesave.userReadData().catchError((e) {
      debugPrint(e.toString());
    });

    if (_userData != null) {
      currentUser.setUserData(_userData);
    }

    print(_userData);
    if (_userData == null) {
      return false;
    }
    return _userData.isNotEmpty;
  }
}
