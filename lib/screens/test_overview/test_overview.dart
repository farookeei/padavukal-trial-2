import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/screens/home/widgets/testcontainer.dart';
import 'package:padavukal/screens/test_description/test_description.dart';
import 'package:padavukal/styles/styles.dart';

class TestOverviewScreen extends StatefulWidget {
  static const routeName = "/test-overview";
  @override
  _TestOverviewScreenState createState() => _TestOverviewScreenState();
}

class _TestOverviewScreenState extends State<TestOverviewScreen> {
  int _value = 1;
  int _value2 = 1;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    // final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(gradient: testGradient),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TestContainer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subjects",
                      style: chapheading,
                    ),
                    SizedBox(height: _height * 0.008),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: testGradient,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                value: _value,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Physics"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Chemistry"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("Biology"), value: 3),
                                  DropdownMenuItem(
                                      child: Text("Mathematics"), value: 4)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }),
                          ),
                        ),
                        //////////////////////
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: testGradient,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                value: _value2,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Chapter 1"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Chapter 2"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                      child: Text("Chapter 3"), value: 3),
                                  DropdownMenuItem(
                                      child: Text("Chapter 4"), value: 4)
                                ],
                                onChanged: (value2) {
                                  setState(() {
                                    _value2 = value2;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _height * 0.02),

                    //////ListView
                    Container(
                      height: 700,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (ctx, i) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      // border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: ListTile(
                                    title: Text("Pre-clinical Subjects Tests"),
                                    subtitle: Text("Physics"),
                                    trailing: IconButton(
                                        icon: Icon(MdiIcons.forward),
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              TestDescription.routeName);
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: _height * 0.009,
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: TabsScreen(),
    );
  }
}
