import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/providers/course.dart';
import 'package:padavukal/providers/models/subject_model.dart';
import 'package:padavukal/providers/models/user_model.dart.dart';
import 'package:padavukal/providers/user.dart';
import 'package:padavukal/screens/chapter_overview/chapterOverview_screen.dart';
import 'package:padavukal/screens/home/widgets/recently_viewed.dart';
import 'package:padavukal/screens/home/widgets/testcontainer.dart';
import 'package:padavukal/styles/styles.dart';
import 'package:padavukal/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    User currentUser =
        Provider.of<UserProvider>(context, listen: false).currentUser;

    Provider.of<CourseProvider>(context, listen: false)
        .subjectVerfication(userToken: currentUser.token);

    Widget _buildIcon(IconData icon, Function onPressed) {
      return IconButton(
          icon: Icon(icon),
          color: Theme.of(context).primaryColor,
          onPressed: onPressed);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIcon(MdiIcons.sortVariant, () {}),
                  Row(children: [
                    _buildIcon(MdiIcons.magnify, () {}),
                    _buildIcon(MdiIcons.bell, () {}),
                  ]),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome.",
                        style: Theme.of(context).primaryTextTheme.headline6),
                    Text("${currentUser.username}",
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 12),
                    //* CONSUMER*******************
                    Consumer<CourseProvider>(builder: (ctx, data, _) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 17,
                          mainAxisSpacing: 17,
                        ),
                        itemCount: data.subjectData.length, //* ITEM COUNT
                        itemBuilder: (ctx, i) {
                          SubjectStatic subject = subjects[i];
                          if (data.isLoading) {
                            return LoadingWidget(
                              title: "Loading Courses",
                            );
                          } else {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ChapterOverView(
                                          subjectsto: subject,
                                          data: data.subjectData[i],
                                        )),
                              ),
                              //* passing data to overview
                              splashColor: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          "${data.subjectData[i].name}",
                                          style: whiteheading2,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child:
                                            Image.asset(subjects[i].imageUrl),
                                        // scale: 7,
                                      ),
                                    ]),
                                decoration: BoxDecoration(
                                  color: subjects[i].color,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                    SizedBox(height: 14),
                    TestContainer(),
                    SizedBox(height: 14),
                    RecentlyViewed()
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
