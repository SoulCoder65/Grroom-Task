import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//Screens
import '../Screens/home_screen.dart';
import '../Screens/swipe_right.dart';
import '../Screens/swipe_left.dart';
import '../Screens/not_available.dart';
//COnstants
import '../Utils/Constants/colors.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final colorpallete = ColorPallete();
  int _selectedPage = 0;
  List<Widget> _ScreenOptions = [
    HomeScreen(),
    SwipeRightScreen(),
    SwipeLeftScreen(),
    NotDeveloped(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ScreenOptions.elementAt(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department_rounded,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cancel,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade900,
        currentIndex: _selectedPage,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        iconSize: 25,
        onTap: _onPageChanged,
      ),
    );
  }
}
