import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:padavukal/screens/home/homeScreen.dart';
import 'package:padavukal/screens/profileScreen/profile_screen.dart';
import 'package:padavukal/screens/test_overview/test_overview.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/tabs-screen";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
      },
      {
        'page': TestOverviewScreen(),
      },
      {
        'page': TestOverviewScreen(),
      },
      {
        'page': ProfileScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _items = [
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
      )
    ];
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        items: _items,
      ),
    );
  }
}
