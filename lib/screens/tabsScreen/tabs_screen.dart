import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/screens/blogScreen/blog.dart';
import 'package:padavukal/screens/home/homeScreen.dart';
import 'package:padavukal/screens/profileScreen/profile_screen.dart';
import 'package:padavukal/screens/test_overview/test_overview.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs-screen";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _selectedPageIndex,
      keepPage: true,
    );
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    _pageController.animateToPage(
      _selectedPageIndex,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pages[_selectedPageIndex]["page"],
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() => _selectedPageIndex = value),
          children: [
            HomeScreen(),
            TestOverviewScreen(),
            Blog(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.textSubject),
            title: Text("Test"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.book),
            title: Text("Blog"),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.account),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
