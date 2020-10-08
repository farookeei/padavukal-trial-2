import 'package:flutter/cupertino.dart';
import 'package:padavukal/providers/models/quiz/question.dart';
import 'package:padavukal/providers/models/testmodel.dart';
import 'package:padavukal/services/basicConfig.dart';

import 'models/chapter_model.dart';
import 'models/coursePayment.dart';
import 'models/coursemodel.dart';
import 'models/subject_model.dart';

class CourseProvider extends BaseConfigAPI with ChangeNotifier {
  String id;
  List<CoursePaymentModel> _coursePaymnetData;
  List<CourseModel> _courseData;
  List<SubjectModel> _subjectData = [];
  List<ChapterModel> _chapterData = [];

  SubjectModel _currentSubject = SubjectModel(
    id: -1,
    name: null,
  );

  SubjectModel get currentSubject => _currentSubject;

  setcurrentSubject(SubjectModel subjectModel) {
    _currentSubject = subjectModel;
    notifyListeners();
  }

  // List<VideoModel> _videoData = [];

  // List<VideoModel> get videoData {
  //   return [..._videoData];
  // }

  List<ChapterModel> get chapterData {
    return [..._chapterData];
  }

  List<SubjectModel> get subjectData {
    return [..._subjectData];
  }

  bool isLoading;

  List<CoursePaymentModel> get coursePaymnetData {
    return [..._coursePaymnetData];
  }

  List<CourseModel> get courseData {
    return [..._courseData];
  }

  CourseProvider({
    this.id,
  });

  Future<List<CourseModel>> retrieveService() async {
    // * data is returned in this way for future builder
    try {
      final List data = await getAPI(url: "/api/service/?list=true");
      List<CourseModel> _temp;

      _temp =
          data.map((e) => CourseModel(id: e['id'], title: e['name'])).toList();

      _courseData = _temp;
      notifyListeners(); //* check if necessary
      return _temp;
    } catch (e) {
      throw e;
    }
  }

  Future<void> coursePaymnet() async {
    try {
      final List _fetchData = await getAPI(url: '/api/package/?list=true&id=1');
      if (_fetchData == null) return null;

      _coursePaymnetData = _fetchData
          .map((e) => CoursePaymentModel(
                amount: e['amount'],
                duration: e['duration'],
                id: e['id'],
                name: e['name'],
                servicesID: e['service'],
              ))
          .toList();
      notifyListeners(); //* check if necessary
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> subjectVerfication({@required String userToken}) async {
    isLoading = true;
    try {
      if (userToken == null) return null;
      if (userToken == 'null') return null;

      List _fetchData =
          await getAPI(url: '/api/subject/?list=true', token: userToken);
      // print(_fetchData);
      _subjectData = [];
      _fetchData.forEach((e) {
        _subjectData.add(
          SubjectModel().fromJson(e),
        );
      });

      if (_subjectData.length > 0) setcurrentSubject(_subjectData.first);
      isLoading = false;
      notifyListeners(); //* check if necessary
      return _fetchData;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // * id received here is subject id
  Future<void> chapterRetrieve(
      {@required String userToken, @required int id}) async {
    isLoading = true;
    try {
      if (userToken == null) return null;
      if (userToken == "null") return null;
      print("object");
      List _fetchData =
          await getAPI(url: "/api/chapter/?list=true&id=$id", token: userToken);
      print("HERE IS THE DATA $_fetchData");
      _chapterData = []; //* very very important
      _fetchData.forEach((e) {
        _chapterData.add(
          ChapterModel().fromJson(e),
        );
      });
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(" THE ERROR $e");
      throw e;
    }
  }

  //* the id received here is chapter id
  Future<List<TestModel>> retrieveTest(
      {@required String userToken, @required int id}) async {
    try {
      if (userToken == null) return null;
      if (userToken == "null") return null;
      List _fetchData =
          await getAPI(url: "/api/test/?list=true&id=$id", token: userToken);
      print(_fetchData);
      List<TestModel> result =
          _fetchData.map<TestModel>((e) => TestModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  //* id received here is test id
  Future<List<Question>> retrieveQuestions(
      {@required String userToken, @required int id}) async {
    try {
      if (userToken == null) return null;
      if (userToken == "null") return null;
      List _fetchData = await getAPI(
        url: "/api/question/?list=true&id=$id",
        token: userToken,
      );
      print(_fetchData);
      return _fetchData.map<Question>((e) => Question.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
