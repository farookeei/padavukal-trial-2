import 'package:flutter/cupertino.dart';
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
      // currentUser.setUserData(data);
      notifyListeners();
      return [data];
    } catch (e) {
      print("error in signup() $e");
      print(e);
      throw e;
    }
  }
}
