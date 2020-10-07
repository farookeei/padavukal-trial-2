import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/models/subject_model.dart';
import 'package:padavukal/providers/models/testmodel.dart';
import 'package:padavukal/screens/test_description/test_description.dart';

class TestItemsWidget extends StatelessWidget {
  const TestItemsWidget({
    Key key,
    @required SubjectModel currentSubject,
    @required this.tests,
    @required double height,
  })  : _currentSubject = currentSubject,
        _height = height,
        super(key: key);

  final SubjectModel _currentSubject;
  final double _height;
  final List<TestModel> tests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tests.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) {
        TestModel testData = tests[i];

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                // border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: ListTile(
                title: Text(testData.test),
                subtitle: Text(
                  _currentSubject.name,
                ),
                trailing: IconButton(
                    icon: Icon(MdiIcons.forward),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        TestDescription.routeName,
                        arguments: testData,
                      );
                    }),
              ),
            ),
            SizedBox(
              height: _height * 0.009,
            )
          ],
        );
      },
    );
  }
}
